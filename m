Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Sen.Zhang@windriver.com>) id 1UcWZF-0005VE-Ox
	for openembedded-core@lists.openembedded.org;
	Wed, 15 May 2013 09:56:12 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r4F7boVu004540
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 15 May 2013 00:37:50 -0700 (PDT)
Received: from [128.224.162.230] (128.224.162.230) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Wed, 15 May 2013 00:37:49 -0700
Message-ID: <51933BC3.5090001@windriver.com>
Date: Wed, 15 May 2013 15:39:47 +0800
From: Jesse Zhang <sen.zhang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130311 Thunderbird/17.0.4
MIME-Version: 1.0
To: =?UTF-8?B?QmrDtnJuIFN0ZW5iZXJn?= <bjst@enea.com>
References: <cover.1368517957.git.sen.zhang@windriver.com>
	<52b7eb9a13f023eb8d5987ac14d79ef265be5d5a.1368517957.git.sen.zhang@windriver.com>
	<20130514125841.GV25918@sestofb10.enea.se>
In-Reply-To: <20130514125841.GV25918@sestofb10.enea.se>
X-Originating-IP: [128.224.162.230]
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.windriver.com id
	r4F7boVu004540
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] perl-tests: convert to ptest
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 15 May 2013 07:56:21 -0000
X-List-Received-Date: Wed, 15 May 2013 07:56:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 05/14/2013 08:58 PM, Bj=C3=B6rn Stenberg wrote:
> Jesse Zhang wrote:
>> +++ b/meta/recipes-devtools/perl/perl-5.14.3/run-ptest
>> @@ -0,0 +1,2 @@
>> +#!/bin/sh
>> +cd t && ./TEST
>=20
> run-ptest also needs to parse the output and reformat results into the =
standard ptest/automake format, such as "PASS: foo", "FAIL: foo" and "SKI=
P: foo".

How verbose should the output be? The TEST script actually does its own
analyzing and summarizing of the test results. Do we want the summary
only or all the details? Do you want the detailed output converted to
ptest format too?

For example,

    # ./TEST=20
    t/base/cond....................................................ok
    t/base/if......................................................ok
    t/base/lex.....................................................ok
    t/base/num.....................................................ok

    # ./TEST -v
    t/base/cond....................................................1..4
    ok 1
    ok 2
    ok 3
    ok 4
    ok
    t/base/if......................................................1..2
    ok 1
    ok 2
    ok
    t/base/lex.....................................................1..57
    #1	:x: eq :x:
    ok 1

The output from the actual test case conforms to the TAP format (not
sure about the top-level TEST). If you have an analysis tool, why not
support one more widely used format? I can't see much value in forcing
one format everywhere.

jesse


