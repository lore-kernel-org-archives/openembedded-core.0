Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C48AF65D33
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Jul 2014 02:20:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s642KFTj007819
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 3 Jul 2014 19:20:15 -0700 (PDT)
Received: from [128.224.162.187] (128.224.162.187) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.169.1;
	Thu, 3 Jul 2014 19:20:14 -0700
Message-ID: <53B60FC1.1070203@windriver.com>
Date: Fri, 4 Jul 2014 10:21:53 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1404110873.git.Qi.Chen@windriver.com>	
	<84fd3c3cb49d0ba85292dee3181b18a46c2081b1.1404110873.git.Qi.Chen@windriver.com>	
	<1404402757.6362.82.camel@ted> <1404404852.6362.85.camel@ted>
	<1404405369.6362.88.camel@ted>
In-Reply-To: <1404405369.6362.88.camel@ted>
X-Originating-IP: [128.224.162.187]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] shadow: upgrade from 4.1.4.3 to 4.2.1
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
X-List-Received-Date: Fri, 04 Jul 2014 02:20:30 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 07/04/2014 12:36 AM, Richard Purdie wrote:
> On Thu, 2014-07-03 at 17:27 +0100, Richard Purdie wrote:
>> On Thu, 2014-07-03 at 16:52 +0100, Richard Purdie wrote:
>>> On Mon, 2014-06-30 at 14:48 +0800, Chen Qi wrote:
>>>> Upgrade shadow from 4.1.4.3 to 4.2.1.
>>>>
>>>> Changes during this upgrade are as following.
>>>>
>>>> 1. Remove the "merged" patches. These patches are either merged or
>>>>     the same functionality has been implemented upstream.
>>>>
>>>>     add_root_cmd_groupmems.patch
>>>>     add_root_cmd_options.patch
>>>>     fix-etc-gshadow-reading.patch
>>>>     shadow-4.1.4.2-env-reset-keep-locale.patch
>>>>     shadow-4.1.4.2-groupmod-pam-check.patch
>>>>     shadow-4.1.4.2-su_no_sanitize_env.patch
>>>>     shadow.automake-1.11.patch
>>>>     shadow_fix_for_automake-1.12.patch
>>>>     useradd.patch
>>>>
>>>> 2. Remove the unneeded patch.
>>>>     The following patch has been removed because the logic in the related
>>>>     codes of the new version has been changed. In specific, the codes now
>>>>     can handle the 'NULL' return value. So there's no need for the following
>>>>     patch.
>>>>
>>>>     slackware_fix_for_glib-2.17_crypt.patch
>>>>
>>>> 3. Teak the current patch to match the new version.
>>>>
>>>>     allow-for-setting-password-in-clear-text.patch
>>>>
>>>> 4. Add a patch to fix compilation failure.
>>>>
>>>>     usermod-fix-compilation-failure-with-subids-disabled.patch
>>>>
>>>> 5. Add a patch to fix the installation failure.
>>>>
>>>>     fix-installation-failure-with-subids-disabled.patch
>>>>
>>>> 5. Add a patch to fix the failure at rootfs time if extrausers is inherited.
>>>>
>>>>     commonio.c-fix-unexpected-open-failure-in-chroot-env.patch
>>>>
>>>> 6. Fix the bad section in the recipe.
>>>>
>>>> 7. Disable the new subids feature in the new version as it doesn't support
>>>>     cross compilation for now.
>>>>
>>>> 8. Modify the pkg_postinst to `exit 1' if the `pwconv' or `grpconv' fails.
>>>>     Also, fix the arguments to use '--root $D' instead of '--root=$D'.
>>> I think this introduces the following issue:
>>>
>>> https://autobuilder.yoctoproject.org/main/builders/nightly-qa-logrotate/builds/154/steps/BuildImages/logs/stdio
>> https://autobuilder.yoctoproject.org/main/builders/build-appliance/builds/158/steps/BuildImages_1/logs/stdio
>>
>> and there are other failures similar to the xuser-account do_install
>> failure. I suspect these reproduce best on builds from scratch.
> For the do_install failure, the ${STAGING_DIR_TARGET}/home directory has
> to exist. If it does from a previous build, the xuser-account will build
> correctly. If home/ doesn't exist it will fail with the error. Its
> similar to a "mkdir" verses "mkdir -p" issue.
>
> I don't know what the second build-appliance failure is due to.
>
> Cheers,
>
> Richard
>
>
>
>
>

Thanks!

I'm looking into the problems now.

Best Regards,
Chen Qi

