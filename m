Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7EB0E6BF4E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jan 2014 13:05:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s07D60K2017380
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 7 Jan 2014 05:06:00 -0800 (PST)
Received: from [128.224.162.226] (128.224.162.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.347.0;
	Tue, 7 Jan 2014 05:05:59 -0800
Message-ID: <52CBFBB5.8030009@windriver.com>
Date: Tue, 7 Jan 2014 21:05:57 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1388769973.git.liezhi.yang@windriver.com>
	<5b836adb7023cf075f9eb2246c7b2bbe420fd1cf.1388769973.git.liezhi.yang@windriver.com>
	<CAJTo0LY2hTEcqZyqrDsoBGEbWYwovCSu7+gZdo4av+9=0w_J5g@mail.gmail.com>
In-Reply-To: <CAJTo0LY2hTEcqZyqrDsoBGEbWYwovCSu7+gZdo4av+9=0w_J5g@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] gconf.bbclass: remove --disable-schemas-install
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
X-List-Received-Date: Tue, 07 Jan 2014 13:05:59 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 01/06/2014 11:47 PM, Burton, Ross wrote:
> On 3 January 2014 17:27, Robert Yang <liezhi.yang@windriver.com> wrote:
>> Gnome has moved the schemas to the gsettings-desktop-schemas pkg, so
>> there is no --disable-schemas-install option any more, and we already
>> have the gsettings-desktop-schemas recipe, so remove it, it wil fix
>> the warning:
>>
>> configure was passed unrecognised options: --disable-schemas-install
>
> I'd NAK this but it's too late as I see it's been merged.
>
> *Some* packages have migrated away from gconf to gsettings.  Not all
> packages have done this, so anything still using gconf is now broken.
> Note that almost nothing in oe-core uses gsettings as we're still
> using the GTK+ 2 stack generally.
>

Hi Ross, which recipe is failed, please ?

// Robert

> The problem is that people are using gnome.bbclass which is a kitchen
> sink class, inheriting many other classes that may or may not be used.
>   To resolve this warning gnome.bbclass should extend the sanity check
> whitelist with --disable-schemas-install as it is the class causing
> gconf.bbclass to be inherited on recipes that don't use gconf.
>
> Ross
>
>

