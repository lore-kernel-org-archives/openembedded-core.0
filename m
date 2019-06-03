Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7414C7DD44
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jun 2019 03:10:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x533AFt1001443
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 2 Jun 2019 20:10:15 -0700 (PDT)
Received: from [128.224.162.186] (128.224.162.186) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Sun, 2 Jun 2019 20:10:14 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Randy MacLeod
	<randy.macleod@windriver.com>, openembedded-core
	<openembedded-core@lists.openembedded.org>, Sakib Sajal
	<sakib.sajal@windriver.com>
References: <69efb132247d1706c6c23262ea59e80f75e96768.camel@linuxfoundation.org>
	<6ed430aa3e5e722cd75b1798cacab3f92eb71b71.camel@linuxfoundation.org>
	<2b4e8d0f-cbb9-d2e4-c17d-33950d3cf9df@windriver.com>
	<7134ea3a82bc3817da8bdc9f52e0867d223b2df4.camel@linuxfoundation.org>
	<090bebe4dfd6ba60188c0476aea5469787a94822.camel@linuxfoundation.org>
From: Changqing Li <changqing.li@windriver.com>
Message-ID: <e044d19f-4cbd-7876-0575-820e9e43d212@windriver.com>
Date: Mon, 3 Jun 2019 11:10:11 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <090bebe4dfd6ba60188c0476aea5469787a94822.camel@linuxfoundation.org>
X-Originating-IP: [128.224.162.186]
Subject: Re: ptest with BBCLASSEXTEND
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
X-List-Received-Date: Mon, 03 Jun 2019 03:10:16 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 5/22/19 6:31 AM, Richard Purdie wrote:
> On Thu, 2019-05-16 at 23:28 +0100, richard.purdie@linuxfoundation.org
> wrote:
>> Just to update from my perspective:
>>
>> quilt and lib*-perl all look like missing perl module dependencies.
>> The place those dependencies are missing may be for the ptest or may
>> be the actual PN package itself, depending on where the module
>> dependency is.
> I've sent out a further patch series which resolves some of the issues.
> Some quilt tests now pass, some still fail. The perl modules fail in
> different ways to before, there are clearly more missing dependencies
> to be added.
>
> A quick summary of roughly the recipes still with problems (not 100%
> accurately filtered):
>
> ==============================================================================================================
> PTest Result Summary
> ==============================================================================================================
> --------------------------------------------------------------------------------------------------------------
> Recipe                       | Passed      | Failed    | Skipped   | Time(s)
> --------------------------------------------------------------------------------------------------------------
> bash                         | 41          | 3         | 0         | 107 T
> bluez5                       | 23          | 2         | 0         | 5
> dbus-test                    | 0           | 0         | 0         | 91 T
> diffutils                    | 19          | 0         | 2         | 1
> e2fsprogs                    | 0           | 0         | 0         | 108 T
> elfutils                     | 172         | 24        | 7         | 19
> gettext                      | 354         | 21        | 37        | 33
> glib-2.0                     | 245         | 0         | 0         | 367
> gstreamer1.0                 | 103         | 1         | 0         | 103
> gzip                         | 19          | 0         | 3         | 3
> kbd                          | 5           | 2         | 0         | 0
> libconvert-asn1-perl         | 0           | 22        | 0         | 0
> liberror-perl                | 2           | 13        | 0         | 0
> libpcre                      | 3           | 0         | 0         | 2
> libtest-needs-perl           | 0           | 2         | 0         | 0
> libtimedate-perl             | 3           | 2         | 0         | 0
> liburi-perl                  | 0           | 39        | 2         | 0
> libxml-namespacesupport-perl | 0           | 1         | 0         | 0
> libxml-parser-perl           | 0           | 15        | 0         | 0
> libxml-perl                  | 0           | 6         | 0         | 0
> libxml-sax-base-perl         | 2           | 17        | 0         | 1
> libxml-sax-perl              | 0           | 14        | 0         | 0
> libxml-simple-perl           | 0           | 14        | 0         | 0
> lttng-tools                  | 3397        | 626       | 1         | 350 T
> m4                           | 144         | 8         | 18        | 5
> nettle                       | 97          | 0         | 2         | 8
> openssh                      | 15          | 1         | 1         | 138
> openssl                      | 146         | 1         | 8         | 87
> opkg                         | 0           | 0         | 0         | 9
> parted                       | 41          | 1         | 22        | 4
> perl                         | 2423        | 19        | 238       | 727
> python                       | 301         | 6         | 41        | 325
> python3                      | 30277       | 2         | 1043      | 1005
> quilt                        | 10          | 47        | 0         | 24
> tcl                          | 149         | 0         | 0         | 177
> valgrind                     | 149         | 1         | 9         | 552
> --------------------------------------------------------------------------------------------------------------
>
> Cheers,
>
> Richard
>
>
Randy,

Based on this list, except lib*perl and packages that are dealing with 
by others,

I picked some for your reference to evaluate the workload.  If more info 
is needed,

feel free to tell me.


diffutils   depend on perl
elfutils:   mingli have work on it and send patch to oe-core mail list
gettext:  depend on certain locales for some tests

               depend on autoconf for some test
gzip:       have tests depend on diff, while diff in busybox 
incompatible with POSIX
               have tests depend on grep, while grep in busybox don't 
support context options
               have tests depend on perl
kbd:       have tests depend on readlink,  busybox's readlink don't 
support -e option
m4:       one test depend on perl, some test skip since depend on 
certain locale/codeset, need to check one by one


-- 
BRs

Sandy(Li Changqing)


