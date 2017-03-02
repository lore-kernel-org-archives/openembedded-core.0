Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f178.google.com (mail-wr0-f178.google.com
	[209.85.128.178])
	by mail.openembedded.org (Postfix) with ESMTP id 32A8D775F4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Mar 2017 19:25:06 +0000 (UTC)
Received: by mail-wr0-f178.google.com with SMTP id u48so59775842wrc.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Mar 2017 11:25:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=iEj21vjhPdawdXOhx1fothkJHI7hfcQXQxamDb/5ZYY=;
	b=OMsyDP8JF94fcWclI0ucd2KU4XB6tQyc9fQC04rlrW/a635gUADSX8V0K/7w78ehzi
	jbxloSFEZOmR+ifnMSfG/EMUwlzb6CrcHeEhrXSgLzilLp65DfZdhru6Cx/QrBdokHci
	E2OqWQiKSrD4uX39AKFEX391AXkVsrCuoV4209nE/JF4uKETStcEwFdtapt6xw0xg027
	YQQxbE5P8APwbJrsJZIqqoHJcJ7d045J6J2cohnpqijRS5tfRYdi6qGJADcms1pYFyPD
	DuE2ButrRsRom6qhULXJDzjkq4i1fj3MqVgmGStDw0cPvbjxkxcJ3n4rPXdA2B6tDa7Y
	iR+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=iEj21vjhPdawdXOhx1fothkJHI7hfcQXQxamDb/5ZYY=;
	b=FSRBRPlzedNOuIYZUP/QQDNvfu6bp5OL3RbzBA4eyeWod8sff8c9viecmOaD9wG2lS
	gocRzfjXWw0Kb0oeexo8hMq7bCG+HPDoFwNt7Ofj3s1b5T2zjp2ZKY4DBJqjXc89f2bs
	mqNzGsi0HWvHusfKCe6Qio/H3GcVNYKEY8hZvzEa41Wds/4b13PgGlnlNrdThUnp2G19
	BRf/aX/WlJEKAgQlB0HtMaPnh0n5fJ+F7ex3GKC/KUlRux9CCXkTRDl7VsqEURvYuNt1
	F+TLpLhzkhTDQj+3G+Sp2h9azlCJqC2lPJxl4Rg57Oal9ASNrvEsHh9IYzeKk+/vMXH2
	XnWQ==
X-Gm-Message-State: AMke39nYw6/o53dh8raDESjNRSsN1BTg6QPGCv39ENk6+B5eRgxd2eXp1PG920ua5OC34BUyi5sDOFsbls04YQ==
X-Received: by 10.223.152.239 with SMTP id w102mr14332757wrb.72.1488482707781; 
	Thu, 02 Mar 2017 11:25:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.174.82 with HTTP; Thu, 2 Mar 2017 11:25:07 -0800 (PST)
In-Reply-To: <CAJ86T=XYuWtMBwFPrQ6wod7s_Jm6qnpVkek1QQt9i2X8Wks10g@mail.gmail.com>
References: <1485556151-9063-1-git-send-email-armccurdy@gmail.com>
	<CAMKF1sp+=6Ot3q5PkQN9Cqv95EGPCK5RQ11EkvhGCrTqo9atHA@mail.gmail.com>
	<CAJ86T=XYuWtMBwFPrQ6wod7s_Jm6qnpVkek1QQt9i2X8Wks10g@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 2 Mar 2017 11:25:07 -0800
Message-ID: <CAJ86T=XtVqkkqZLfxechBnkzMO15MoKxuVFCY=1K9NXgrcLKog@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] replace USE_LDCONFIG with ldconfig distro feature
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
X-List-Received-Date: Thu, 02 Mar 2017 19:25:07 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Feb 28, 2017 at 11:17 AM, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Thu, Feb 2, 2017 at 5:44 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> On Fri, Jan 27, 2017 at 2:29 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>>> Andre McCurdy (2):
>>>   bitbake.conf: replace USE_LDCONFIG with new "ldconfig" distro feature
>>>   systemd: check "ldconfig" distro feature when setting PACKAGECONFIG
>>>
>>>  meta/classes/package.bbclass              | 5 +----
>>>  meta/conf/bitbake.conf                    | 2 +-
>>>  meta/recipes-core/glibc/glibc-package.inc | 9 +++------
>>>  meta/recipes-core/systemd/systemd_232.bb  | 2 +-
>>>  4 files changed, 6 insertions(+), 12 deletions(-)
>>
>> This changeset looks good.
>>
>> Acked-by: Khem Raj <raj.khem@gmail.com>
>
> Ping.

Ross, thanks for rebasing.

However, as part of this:

PACKAGECONFIG ??= "xz \
ldconfig \
- ${@bb.utils.filter('DISTRO_FEATURES', 'efi pam selinux', d)} \
+ ${@bb.utils.filter('DISTRO_FEATURES', 'efi pam selinux ldconfig', d)} \
${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xkbcommon', '', d)} \
${@bb.utils.contains('DISTRO_FEATURES', 'wifi', 'rfkill', '', d)} \
binfmt \

the existing hardcoded "ldconfig" in PACKAGECONFIG should also be removed.

>>>
>>> --
>>> 1.9.1
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

