Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E9BC17E06A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 May 2019 21:13:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x4GLDFCJ008568
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 16 May 2019 14:13:26 -0700
Received: from [172.25.44.4] (172.25.44.4) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.439.0;
	Thu, 16 May 2019 14:13:04 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>, "Li, Changqing"
	<changqing.li@windriver.com>, Sakib Sajal <sakib.sajal@windriver.com>
References: <69efb132247d1706c6c23262ea59e80f75e96768.camel@linuxfoundation.org>
	<6ed430aa3e5e722cd75b1798cacab3f92eb71b71.camel@linuxfoundation.org>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <2b4e8d0f-cbb9-d2e4-c17d-33950d3cf9df@windriver.com>
Date: Thu, 16 May 2019 17:13:03 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <6ed430aa3e5e722cd75b1798cacab3f92eb71b71.camel@linuxfoundation.org>
X-Originating-IP: [172.25.44.4]
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
X-List-Received-Date: Thu, 16 May 2019 21:13:52 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 5/16/19 8:36 AM, Richard Purdie wrote:
> On Thu, 2019-05-16 at 11:54 +0100, Richard Purdie wrote:
>> https://autobuilder.yocto.io/pub/non-release/20190514-14/testresults/testresult-report.txt
> 
> A couple of patches (on the list) gets us to the results below which is
> better. The perl module failures and quilt are from missing perl module
> dependencies.
> 
> --------------------------------------------------------------------------------------------------------------
> Recipe                       | Passed      | Failed    | Skipped   | Time(s)
> --------------------------------------------------------------------------------------------------------------
> acl                          | 3           | 0         | 0         | 0
> apr                          | 44          | 0         | 0         | 58
> apr-util                     | 19          | 0         | 0         | 8
> attr                         | 0           | 0         | 0         | 0
> bash                         | 36          | 8         | 0         | 108 T
> bluez5                       | 23          | 2         | 0         | 5
> busybox                      | 528         | 4         | 76        | 4
> bzip2                        | 6           | 0         | 0         | 1
> dbus-test                    | 0           | 0         | 0         | 91 T
> diffstat                     | 439         | 0         | 0         | 3
> diffutils                    | 19          | 0         | 2         | 2
> e2fsprogs                    | 0           | 0         | 0         | 108 T
> elfutils                     | 172         | 24        | 7         | 20
> ethtool                      | 2           | 0         | 0         | 1
> flex                         | 114         | 0         | 0         | 2
> gawk                         | 342         | 0         | 0         | 2
> gdbm                         | 24          | 0         | 0         | 2
> gdk-pixbuf                   | 20          | 0         | 0         | 39
> gettext                      | 354         | 21        | 37        | 33
> glib-2.0                     | 242         | 3         | 0         | 347
> gstreamer1.0                 | 103         | 1         | 0         | 104
> gzip                         | 19          | 0         | 3         | 4
> json-glib                    | 14          | 0         | 0         | 0
> kbd                          | 5           | 2         | 0         | 1
> libconvert-asn1-perl         | 0           | 22        | 0         | 0
> liberror-perl                | 0           | 15        | 0         | 0
> libevent                     | 1           | 0         | 0         | 86
> libpcre                      | 0           | 0         | 0         | 1
> libtest-needs-perl           | 0           | 2         | 0         | 0
> libtimedate-perl             | 3           | 2         | 0         | 0
> liburi-perl                  | 0           | 39        | 2         | 0
> libusb1                      | 4           | 0         | 0         | 6
> libxml-namespacesupport-perl | 0           | 1         | 0         | 0
> libxml-parser-perl           | 0           | 15        | 0         | 0
> libxml-perl                  | 0           | 6         | 0         | 0
> libxml-sax-base-perl         | 0           | 19        | 0         | 0
> libxml-sax-perl              | 0           | 14        | 0         | 0
> libxml-simple-perl           | 0           | 14        | 0         | 0
> libxml2                      | 134         | 0         | 0         | 17
> lttng-tools                  | 3397        | 626       | 1         | 350 T
> lzo                          | 5           | 0         | 0         | 2
> m4                           | 144         | 8         | 18        | 5
> nettle                       | 97          | 0         | 2         | 9
> openssh                      | 0           | 0         | 1         | 1
> openssl                      | 146         | 1         | 8         | 91
> opkg                         | 0           | 0         | 0         | 11
> pango                        | 12          | 0         | 0         | 1
> parted                       | 41          | 1         | 22        | 5
> perl                         | 2423        | 19        | 238       | 713
> python                       | 301         | 6         | 41        | 325
> python3                      | 30277       | 2         | 1043      | 990
> quilt                        | 0           | 57        | 0         | 0
> sed                          | 86          | 0         | 0         | 4
> slang                        | 97          | 0         | 0         | 22
> strace                       | 466         | 18        | 147       | 176
> tcl                          | 149         | 0         | 0         | 179
> util-linux                   | 336         | 2         | 80        | 41
> valgrind                     | 149         | 1         | 9         | 544
> zlib                         | 1           | 0         | 0         | 1
> 
> Cheers,
> 
> Richard
> 

During the weekly YP bug review meeting, we discussed creating a
defect per package for each of these ptest failures and marking them
each as NEWCOMER bugs but we really need to keep working on ptest
improvements. I'd like Sandy (Changqing), Sajal and perhaps others
at Wind River (or elsewhere!) to split up the list above to fix
any missing dependencies.

Sajal is a new student working at working from Ottawa. He has some
experience with Yocto from a previous student placement. I've asked him
to work on the bash package ptest errors and I'll add quilt and strace
as well.

For the rest of the list, Sandy can pick a few and see if there's
a pattern to the failures or not. Once we have that info we can
decide how many people we need to deal with the rest of the
packages for fix most of the dependency issues over the coming
weeks. It would be nice to have most of them wrapped up for 2.8-M1.

-- 
# Randy MacLeod
# Wind River Linux

