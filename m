Return-Path: <laurentiu.palcu@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id DED816AF00
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jul 2013 15:39:10 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 04 Jul 2013 08:39:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,995,1363158000"; d="scan'208";a="365331762"
Received: from lpalcu-linux.rb.intel.com (HELO [10.237.105.165])
	([10.237.105.165])
	by fmsmga002.fm.intel.com with ESMTP; 04 Jul 2013 08:39:10 -0700
Message-ID: <51D5971D.3020103@intel.com>
Date: Thu, 04 Jul 2013 18:39:09 +0300
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1372933905.git.laurentiu.palcu@intel.com>
	<11aefd86a570528092c6f4f5de1371204b1f30ec.1372933905.git.laurentiu.palcu@intel.com>
	<CAJTo0LbxsXLXfHZa91nUuWYBWTLUeqBzrfZENV910io98MnMZQ@mail.gmail.com>
In-Reply-To: <CAJTo0LbxsXLXfHZa91nUuWYBWTLUeqBzrfZENV910io98MnMZQ@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 5/5] shutdown-desktop: give entire path in Exec field
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
X-List-Received-Date: Thu, 04 Jul 2013 15:39:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 07/04/2013 05:58 PM, Burton, Ross wrote:
> On 4 July 2013 11:58, Laurentiu Palcu <laurentiu.palcu@intel.com> wrote:
>> +    sed -i $D${datadir}/applications/shutdown.desktop -e 's#^Exec=\(.*\)#Exec=${base_sbindir}/\1#'
> 
> Doing this in postinst is pretty nasty, 
Nasty, in what way? How is this line different from the previous line in
the same postinstall? That one is also using sed to change 'halt' to
'reboot' for qemuarm. Is it the sed you're worried about? This
postinstall is executed on host anyway, at do_rootfs().

> instead change the desktop
> file to contain something like @SBIN@ and run it through sed in
> do_install.
Even though the change you're proposing is OK, involves changing the
desktop file to add the @SBIN@ pattern and move the sed line to
do_install(). Compared to having one single line added in the
postinstall... I would choose the latter, unless you elaborate on what
do you actually mean by "nasty".

Laurentiu
> 
> Ross
> 

