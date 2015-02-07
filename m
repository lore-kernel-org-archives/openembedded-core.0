Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f175.google.com (mail-yk0-f175.google.com
	[209.85.160.175])
	by mail.openembedded.org (Postfix) with ESMTP id 15ECE60017
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Feb 2015 21:48:53 +0000 (UTC)
Received: by mail-yk0-f175.google.com with SMTP id 10so4436260ykt.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 07 Feb 2015 13:48:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=upHZVhGX4cj53HZIVoBcSF2aWNFq69I/j7X2Pq7c1XU=;
	b=Hzpg1zgEGDeXeVWpAGPo+gCEC0TdwShsOk9Pc1DaEEoC710vugIj38qwoYSRcqdRyU
	GgSf7xWVWZDWOlJV2v3NbpayIJMgPXn98fu0aNyH6XutjzBPp5mzTVIvtDI2LcBUm7ji
	J2qNoy+aZmu09Ah53lnpSX/ZTXZvB5h8+/YWj1u6YjKM3BHYd8DvpC2NR9deh6Hyp3O1
	S8dQ1ETazBGHSuyJhhy/bdF67SA+0bMkR1wIW6n3m0ftLpwfdj1P3nf5daAcFVyQ/geu
	Ay2xI42wRShsS9V1pOsoKWRH1ACXBD8AGw6HjH/Bj/yNqErtmZnVbX5xEzfIRUACqwG9
	tSwA==
MIME-Version: 1.0
X-Received: by 10.170.162.135 with SMTP id e129mr3986393ykd.110.1423345735060; 
	Sat, 07 Feb 2015 13:48:55 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.123.143 with HTTP; Sat, 7 Feb 2015 13:48:54 -0800 (PST)
In-Reply-To: <1423263383-15461-1-git-send-email-nathan_lynch@mentor.com>
References: <1423263383-15461-1-git-send-email-nathan_lynch@mentor.com>
Date: Sat, 7 Feb 2015 19:48:54 -0200
X-Google-Sender-Auth: 8H-vqOchKq0sc98Mvxop01ZY1X8
Message-ID: <CAP9ODKqwuOnwWH3Otue31U8z1S_ypiFdwhHnY3t=3yG_Z5MLnQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Nathan Lynch <nathan_lynch@mentor.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] lttng-tools: use perl-misc, perl-modules in ptest deps
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
X-List-Received-Date: Sat, 07 Feb 2015 21:49:02 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Feb 6, 2015 at 8:56 PM, Nathan Lynch <nathan_lynch@mentor.com> wrote:
> The testcases for lttng-tools use the "prove" command from perl-misc,
> which needs many modules not in the base perl package.
>
> Signed-off-by: Nathan Lynch <nathan_lynch@mentor.com>

Wouldn't be better to specify the modules needed for the prove
command? This avoids unneeded packages to be installed.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

