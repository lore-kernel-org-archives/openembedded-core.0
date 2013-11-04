Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f178.google.com (mail-ob0-f178.google.com
	[209.85.214.178])
	by mail.openembedded.org (Postfix) with ESMTP id 1184E6CA2B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Nov 2013 11:48:35 +0000 (UTC)
Received: by mail-ob0-f178.google.com with SMTP id wm4so6872805obc.23
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Nov 2013 03:48:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=2Ckew9Aq+1ddn4EuxR/SeaXY02AtC4IP66r+/e9ipiA=;
	b=AcPSJfCqoC/6YkVzyw/1xzv17lpvqA5QydnZlE66ENXJp35oYMxstOHJjssECfTgaA
	oIUI1Se0xnqNL03MesqtXETeAhg7nPte16hGdi9DV+oXahb1h6T2El0lP+0E0yr6OLaN
	xebvTTXiYRjfV3y08V5J/CEgDh0K108/j/YL7sa8ucqiCme7yRRMxtSEHgLTDRJXHz/G
	enawqWpvj3wt/1YrZuq+umFqv0TJnU5ZXYdi2yvxpG1YRnU5Nipn56qp5N9MiuYUihHy
	YV3y/2xdNJhne1IFtqkpvzI/B9h+W0V4y9gVRC3NlEwwBsMxwb2Z+SJXc69a1z9vfhs1
	hd4w==
MIME-Version: 1.0
X-Received: by 10.60.155.166 with SMTP id vx6mr14174741oeb.28.1383565716328;
	Mon, 04 Nov 2013 03:48:36 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Mon, 4 Nov 2013 03:48:36 -0800 (PST)
In-Reply-To: <1383565168.6271.107.camel@ted>
References: <cover.1383558655.git.hongxu.jia@windriver.com>
	<1383565168.6271.107.camel@ted>
Date: Mon, 4 Nov 2013 09:48:36 -0200
X-Google-Sender-Auth: VgmN9vZn0o2owm9BbNBWzZeNjaI
Message-ID: <CAP9ODKqr8eHVck5YSpVCgxugW7UJZrXfNey=sM=_6Eo-W1HPDg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, Saul Wold <saul.wold@intel.com>
Subject: Re: [PATCH V2 0/5] fix WARNING: QA Issue on kmod/udev/nfs-utils (unsafe references [/ references to /usr/lib])
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
X-List-Received-Date: Mon, 04 Nov 2013 11:48:35 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Nov 4, 2013 at 9:39 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Mon, 2013-11-04 at 17:56 +0800, Hongxu Jia wrote:
>> Change in V2: The fourth patch fixed the QA Issue on udev, it was missed on previous version.
>>
>> //Hongxu
>>
>> The following changes since commit f3541226b8b1187e79dec0f6f9f3c58cedf9ac9b:
>>
>>   bitbake: hob: do not display the "Package list may be incomplete!" dialog (2013-11-01 17:59:31 +0000)
>>
>> are available in the git repository at:
>>
>>   git://git.pokylinux.org/poky-contrib hongxu/fix-qa-issue
>>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-qa-issue
>>
>> Hongxu Jia (5):
>>   insane.bbclass: support to skip  unsafe references in binaries qa
>>     check.
>>   kmod: fix QA issue
>>   udev: fix  QA issue
>>   udev: fix QA issue
>>   nfs-utils: fix QA issue
>
> Last time these warnings came up I asked for a clear plan about what
> needed to live in / and what needed to live in /usr and how we were
> going to fix things once and for all (or forget this idea).
>
> Where is the plan? Why is it ok to just ignore these particular
> warnings?

I don't think supporting /bin and /sbin separated than /usr is worth the work.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

