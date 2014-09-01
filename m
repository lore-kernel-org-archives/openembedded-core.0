Return-Path: <lpapp@archlinux.us>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id 3E2676FCA3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Sep 2014 17:47:11 +0000 (UTC)
Received: by mail-pa0-f43.google.com with SMTP id et14so12882789pad.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Sep 2014 10:47:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=l02LxAnQ1t5wqj1/90vQZm3WP3tNqKXGDLVefwjxnxw=;
	b=RQnOMXe2ymkxHZSLks8ZyzARM1DuG2uOrpdZT4YjjnPKmvsDWzjP9TLFP0z7iMpF2U
	6SAspXUpX6HrOhyIrTqCHJuHJIQGVYRJ7KtVZUemIDTsjqhw6MxSFaRJQRCV+LBWjrcu
	N/0SCxTQdwbsmpjGPUyyCBj2AgZsGqzklnLVRSGRuM63rUvSRejcAFZWpeQInRlBMxy6
	5thVA0YOLBdcxaw2AitFGVh9j+Qf8fvp1uaYToOuLMcBHFBwcdE0VJLw6DdOVMnY7uRB
	FEVT/Tn0Fiu33U7UTtP9mrFr+URhbVCzZsEkZIOaOMlbB+UPo57VN6hvnjXiqSYcLX8d
	XE/g==
X-Gm-Message-State: ALoCoQl9SPGoZzxjQ7Xp9bQ0rBUCSrdiLb3oVXSp2lMNVjNCDN5H5M5cCVI+OFqjIRXr5rJ3/S5e
MIME-Version: 1.0
X-Received: by 10.66.185.14 with SMTP id ey14mr6160372pac.136.1409593632710;
	Mon, 01 Sep 2014 10:47:12 -0700 (PDT)
Sender: lpapp@archlinux.us
Received: by 10.70.57.136 with HTTP; Mon, 1 Sep 2014 10:47:12 -0700 (PDT)
In-Reply-To: <CAOMwXhPptiMrE7_VNi1rLtv0qzVf=0CHSJ5nn=dTi8GxBtFtHQ@mail.gmail.com>
References: <1408720803-11737-1-git-send-email-lpapp@kde.org>
	<5400C6A5.6040001@linux.intel.com>
	<CAOMwXhPptiMrE7_VNi1rLtv0qzVf=0CHSJ5nn=dTi8GxBtFtHQ@mail.gmail.com>
Date: Mon, 1 Sep 2014 18:47:12 +0100
X-Google-Sender-Auth: SBcNfrz6f0LuiNAmyN_tOnbDcKo
Message-ID: <CAOMwXhP+A40Kcb-KcgCh8rh-oNXh-9DjyBJ4hAunJ7Q7_i8VUA@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: Saul Wold <sgw@linux.intel.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Add support for ccache builds with the SDK
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
X-List-Received-Date: Mon, 01 Sep 2014 17:47:17 -0000
Content-Type: text/plain; charset=UTF-8

Just in case the severity is not clear. Without this change, the Yocto
SDK breaks the build for our software since we do prefer to use ccache
for speeding the build process up. We are probably not alone with that
...

On Mon, Sep 1, 2014 at 6:34 PM, Laszlo Papp <lpapp@kde.org> wrote:
> It is indeed nit, and not something I wishfully spend my time with, so
> feel free to rewrite the commit message and integrate the ccache
> support. As usual, this feature is also applied in our fork, so I am
> fine... It is only the upstream Yocto users who may be missing
> features out.
>
> Having said that, thank you for your feedback.
>
> On Fri, Aug 29, 2014 at 7:29 PM, Saul Wold <sgw@linux.intel.com> wrote:
>>
>> Might be a nit, but can you please follow the Commit Guildlines at
>> http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
>>
>> The summary should include the filename or area of the fix
>>
>> toolchain-script: Add ...
>>
>> Also can you expand on the why this is needed?
>>
>> Thanks
>>         Sau!
>>
>>
>> On 08/22/2014 08:20 AM, Laszlo Papp wrote:
>>>
>>> Signed-off-by: Laszlo Papp <lpapp@kde.org>
>>> ---
>>>   meta/classes/toolchain-scripts.bbclass | 2 ++
>>>   1 file changed, 2 insertions(+)
>>>
>>> diff --git a/meta/classes/toolchain-scripts.bbclass
>>> b/meta/classes/toolchain-scripts.bbclass
>>> index 6cc8eba..60278d6 100644
>>> --- a/meta/classes/toolchain-scripts.bbclass
>>> +++ b/meta/classes/toolchain-scripts.bbclass
>>> @@ -19,6 +19,7 @@ toolchain_create_sdk_env_script () {
>>>
>>> EXTRAPATH="$EXTRAPATH:${SDKPATHNATIVE}${bindir_nativesdk}/${TARGET_ARCH}${TARGET_VENDOR}-$i"
>>>         done
>>>         echo 'export
>>> PATH=${SDKPATHNATIVE}${bindir_nativesdk}:${SDKPATHNATIVE}${bindir_nativesdk}/${TARGET_SYS}'$EXTRAPATH':$PATH'
>>> >> $script
>>> +       echo 'export
>>> CCACHE_PATH=${SDKPATHNATIVE}${bindir_nativesdk}:${SDKPATHNATIVE}${bindir_nativesdk}/${TARGET_SYS}'$EXTRAPATH':$CCACHE_PATH'
>>> >> $script
>>>         echo 'export PKG_CONFIG_SYSROOT_DIR=$SDKTARGETSYSROOT' >> $script
>>>         echo 'export
>>> PKG_CONFIG_PATH=$SDKTARGETSYSROOT'"$libdir"'/pkgconfig' >> $script
>>>         echo 'export
>>> CONFIG_SITE=${SDKPATH}/site-config-'"${multimach_target_sys}" >> $script
>>> @@ -37,6 +38,7 @@ toolchain_create_tree_env_script () {
>>>         rm -f $script
>>>         touch $script
>>>         echo 'export PATH=${STAGING_DIR_NATIVE}/usr/bin:${PATH}' >>
>>> $script
>>> +       echo 'export
>>> CCACHE_PATH=${STAGING_DIR_NATIVE}/usr/bin:${CCACHE_PATH}' >> $script
>>>         echo 'export PKG_CONFIG_SYSROOT_DIR=${PKG_CONFIG_SYSROOT_DIR}' >>
>>> $script
>>>         echo 'export PKG_CONFIG_PATH=${PKG_CONFIG_PATH}' >> $script
>>>         echo 'export CONFIG_SITE="${@siteinfo_get_files(d)}"' >> $script
>>>
>>

