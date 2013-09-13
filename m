Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by mail.openembedded.org (Postfix) with ESMTP id E952F6B6B1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2013 17:11:51 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id h1so1435474oag.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2013 10:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=IKozNCxvIUnW94JyEw2mH191ollftakAniGGXL7WL3w=;
	b=NlRs85OguVoq/KvYb/DMUQhX50S9DhLcBB97OsI2VtxXThrlbgUYjBJmQSF0KMePIs
	ApebJsd84Hv0/WuPWdewoYxtoPqvyHUvGYWJ3qgJWpVo9luEo2JtPCcpP18qw67M1F94
	7uXwYOYNOnFQNUw84O7dEOrdX23op2+1ZUiOVAzfFWDjzDtwOraSLISUxLYcTdSLciK5
	NWmF8N0vUTWDslT0MPCBGuGSZaJS4wVTEsOg0w/d+ID2W1N6Xzt5rGnkQCn68H6jr1Ky
	xtBp+NT1V3GF+1qJGLS6BgfGz6IKIHd6GBraEcNcLVqgzIBG5OOjd5sPleUS/VsxE/o+
	JM3Q==
MIME-Version: 1.0
X-Received: by 10.182.144.136 with SMTP id sm8mr3128440obb.63.1379092312983;
	Fri, 13 Sep 2013 10:11:52 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Fri, 13 Sep 2013 10:11:52 -0700 (PDT)
In-Reply-To: <522EDE9D.5080406@windriver.com>
References: <1366631550-12726-1-git-send-email-otavio@ossystems.com.br>
	<522EDE9D.5080406@windriver.com>
Date: Fri, 13 Sep 2013 14:11:52 -0300
X-Google-Sender-Auth: snkC6qkVtyb9dC9yZUO4BIa7H9E
Message-ID: <CAP9ODKopmbCMyHtVukCaYd+L0UQFFx1h8D6-A1t5sRzMUkmpRg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: ChenQi <Qi.Chen@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] udev-extraconf: Avoid mounting unknown filesystems
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
X-List-Received-Date: Fri, 13 Sep 2013 17:11:52 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Sep 10, 2013 at 5:55 AM, ChenQi <Qi.Chen@windriver.com> wrote:
> Hi Otavio,

Hi Chen Qi,

> This patch caused a new bug. So I'm afraid maybe this patch is not totally
> correct.
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=4487
>
> The problem is that for a cdrom device, there's no ID_FS_TYPE.
> Any idea?

I noticed you did found a fix for this
(http://cgit.openembedded.org/openembedded-core/commit/?id=2df21a3b27543df912a3ce05bef2415fae13cb7c)
and I agree with the code change.

> Besides, could you please detail a little about what problem this patch is
> trying to solve?
> Which kernel version is involved?

This happens with 2.6.35.3 kernel IIRC. But your fix seems to proper
add support for cdrom and should be the way to go.

Thanks for looking at it.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

