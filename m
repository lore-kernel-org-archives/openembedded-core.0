Return-Path: <David.Nystrom@enea.com>
Received: from mx-3.enea.com (unknown [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 8AA5E6BFA9
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Mar 2014 12:34:52 +0000 (UTC)
Received: from [172.16.141.133] (172.16.141.133) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.158.1; Wed, 5 Mar 2014
	13:34:46 +0100
Message-ID: <531719E1.2080501@enea.com>
Date: Wed, 5 Mar 2014 13:34:41 +0100
From: =?ISO-8859-1?Q?David_Nystr=F6m?= <david.nystrom@enea.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1394018657.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1394018657.git.paul.eggleton@linux.intel.com>
X-Originating-IP: [172.16.141.133]
Subject: Re: [PATCH 0/3] gnutls fixes for master
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Mar 2014 12:34:54 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 2014-03-05 12:25, Paul Eggleton wrote:
> Turns out we're using the same old version of gnutls in master as in
> dylan and dora, and we need a fix for a compile failure.
>
>
> The following changes since commit 82c773e88aaefd9321481ad297554d5b4a3ae0b2:
>
>    Revert "ncurses: use ln -r to generate relative symlink" (2014-03-03 15:52:26 +0000)
>
> are available in the git repository at:
>
>    git://git.openembedded.org/openembedded-core-contrib paule/gnutls
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/gnutls
>
> Karl Hiramoto (2):
>    gnutls: CVE-2014-0092 correct return codes
>    gnutls: Fixed bug that prevented the rejection of v1 intermediate CA
>      certificates.
>
> Paul Eggleton (1):
>    gnutls: fix failure during do_compile

Any specific reasons why we still have the old gnuTLS-2.12.23 ?

Br,
David

