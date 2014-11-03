Return-Path: <lpapp@archlinux.us>
Received: from mail-vc0-f170.google.com (mail-vc0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id 501E965DEB
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Nov 2014 17:32:16 +0000 (UTC)
Received: by mail-vc0-f170.google.com with SMTP id la4so5026106vcb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Nov 2014 09:32:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=TpQjurKjs43C7xXEVe1E4pWWcLlabrO7e4WqC5UwbNQ=;
	b=CqWIC5LWJhcNLzpjGBfQelLpNFhrJ722ApZr/yFVMk1ETut/BCVrzch8E/8vSyrCCb
	DU5VQv+Am4O0gU85jHLhI3SLXBZJNrpcUI16SezhPV06NOJpq/OA+l2L7G7u3BXVCxnL
	tBrEWGyOg5ZJhqxXzbkFTGHcUb/II0BhM1xxEWhSuw/PlpqgjixXOJSKdFMdDNUTSsaj
	Wj84fJJgxE/h/M6+LINdRGqRKLQiWA4r0elnB0jW/wYqomVGLi9Zy3VkXxk2cNUAwr5j
	qmFNp5QA2vWuE2exiHne5GuAZ/Y/P9WrJCmBhi5N2s7tHkySi7jYRWTN5LvKiqpGKdsP
	jXlg==
X-Gm-Message-State: ALoCoQmjWxjzSgy6NpQr4XXxU9CkRzTzLz1Mk/uNnPAUefOcazmpE3SE2w652My0rvt23aULtIbI
MIME-Version: 1.0
X-Received: by 10.220.127.5 with SMTP id e5mr3012088vcs.40.1415035936849; Mon,
	03 Nov 2014 09:32:16 -0800 (PST)
Sender: lpapp@archlinux.us
Received: by 10.31.188.132 with HTTP; Mon, 3 Nov 2014 09:32:16 -0800 (PST)
In-Reply-To: <CAOMwXhPbXCQ7ui+J0a8ryekeq5Yy5EXdgt-Qr26Z9w74=vyD5w@mail.gmail.com>
References: <CAOMwXhPbXCQ7ui+J0a8ryekeq5Yy5EXdgt-Qr26Z9w74=vyD5w@mail.gmail.com>
Date: Mon, 3 Nov 2014 17:32:16 +0000
X-Google-Sender-Auth: Wi4lHYnciO2uD7g0SZ5Bv366rjY
Message-ID: <CAOMwXhP7gaoBAHnN3sG4007WAe5cybW5qbzNZLWR-ovk7Z46=Q@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Specifying 32 bit dependency for 64 bit software
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
X-List-Received-Date: Mon, 03 Nov 2014 17:32:25 -0000
Content-Type: text/plain; charset=UTF-8

Forgot to mention, but any nice workarounds are appreciated. I have a
few ideas, but they are all a bit ugly and non-robust.

On Mon, Nov 3, 2014 at 5:29 PM, Laszlo Papp <lpapp@kde.org> wrote:
> Hi,
>
> we have a tool that we run during our make run, but this tool is
> hard-coded for 32 bit. It depends on software like ncurses. I could
> add ncurses-native in an ideal world; no problem.
>
> The problem is that my host environment is 64 bit currently and it is
> not possible to migrate the whole environment to 32 bit. I am happy to
> explain the details if needed, but I would love you to trust me about
> that. =)
>
> So, is it possible to say more than just DEPENDS = ncurses-native,
> something like DEPENDS = ncurses-native:x86 or something?
>
> Cheers, L.

