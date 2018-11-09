Return-Path: <sstrogin@cisco.com>
X-Greylist: delayed 585 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 09 Nov 2018 18:30:43 UTC
Received: from aer-iport-2.cisco.com (aer-iport-2.cisco.com [173.38.203.52])
	by mail.openembedded.org (Postfix) with ESMTP id 1A7856BF38
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Nov 2018 18:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=1852; q=dns/txt; s=iport;
	t=1541788245; x=1542997845;
	h=to:cc:references:from:subject:message-id:date:
	mime-version:in-reply-to:content-transfer-encoding;
	bh=pMImu1vNwTf4EfF8FxTc80qab+pzGbDw2IcNGf3DHew=;
	b=W0jUR/Zyj8/xOEoQO8g11uM9xiKROOaMfXFxhCPWoKNIB+xpQECiks7c
	+CwyXr5wm8KOVga7Bh7DJZAp4GqJ3S86UJkjlWiE4egCWF248Xq02IT+t
	o3MhabKA7oo2JTMjkbxD0ednzkxR6jD5aMpT0gEfXX6jDAsyicyakJ4Jy Q=;
X-IronPort-AV: E=Sophos;i="5.54,484,1534809600"; 
   d="scan'208";a="7933456"
Received: from aer-iport-nat.cisco.com (HELO aer-core-1.cisco.com)
	([173.38.203.22])
	by aer-iport-2.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Nov 2018 18:20:59 +0000
Received: from [10.61.209.171] ([10.61.209.171]) (authenticated bits=0)
	by aer-core-1.cisco.com (8.15.2/8.15.2) with ESMTPSA id wA9IKvtu022752
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NO);
	Fri, 9 Nov 2018 18:20:58 GMT
To: "Burton, Ross" <ross.burton@intel.com>
References: <20181108093631.28934-1-sstrogin@cisco.com>
	<CAJTo0LZZHgHV3itvJpD+_WZuH56gLjSGBhtY+3PQv3V7rKdYBA@mail.gmail.com>
From: Stefan Strogin <sstrogin@cisco.com>
Openpgp: preference=signencrypt
Autocrypt: addr=sstrogin@cisco.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <320acd4d-5aed-54a4-dba9-393f36e939d3@cisco.com>
Date: Fri, 9 Nov 2018 20:23:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZZHgHV3itvJpD+_WZuH56gLjSGBhtY+3PQv3V7rKdYBA@mail.gmail.com>
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Authenticated-User: sstrogin
X-Outbound-SMTP-Client: 10.61.209.171, [10.61.209.171]
X-Outbound-Node: aer-core-1.cisco.com
Cc: XE-Linux <xe-linux-external@cisco.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] avahi: add ptest
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
X-List-Received-Date: Fri, 09 Nov 2018 18:30:44 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Ross,

On 09/11/2018 15:29, Burton, Ross wrote:
> On Thu, 8 Nov 2018 at 09:44, Stefan Strogin via Openembedded-core
> <openembedded-core@lists.openembedded.org> wrote:
>> +do_install_ptest () {
>> +    install -d ${D}${PTEST_PATH}/test/.libs
>> +    for t in dns-spin-test dns-test hashmap-test
>> +    do
>> +        install -m 0755 ${B}/avahi-core/$t ${D}${PTEST_PATH}/test/
>> +        sed -e 's/^relink_command=\"\(.*\)\"/relink_command=\"\"/' -i ${D}${PTEST_PATH}/test/$t
>> +        install -m 0755 ${B}/avahi-core/.libs/$t ${D}${PTEST_PATH}/test/.libs/lt-$t
>> +    done
>> +}
> 
> Whilst I really do want to see more test suites, is this really a
> useful test suite?  hashmap-test is a validation that the hash
> implementation works, dns-test is low-level parsing, and dns-spin-test
> is basically a way to verify an Avahi bug doesn't regress.  This isn't
> exactly a full-featured test suite that creates services, ensures
> they're browsable, enumerate stuff, etc.

Thanks for the good comment. In our distro we also want to cover with tests
as many packages as possible. There are more tests in avahi source code like
avahi-test, conformance-test, querier-test, update-test...

Unfortunately the test suite is not documented at all (at least I couldn't
find any documentation on them), and I'm not very familiar with Avahi API
and the source code.
Some of the tests in case of success seem to run in an infinite loop, and exit
only in case of error. So I couldn't include them into the recipe. Maybe the
tests need to be patched [upstream].
I began to investigate it but unfortunately didn't have time, and now I have
some more urgent tasks. So I added only those tests in which I'm sure, perhaps
it's too few.
I hope to add more tests some day, or somebody else will be able to do it.

--
Stefan

