Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f181.google.com (mail-ob0-f181.google.com
	[209.85.214.181])
	by mail.openembedded.org (Postfix) with ESMTP id B5ECE6607F;
	Fri, 11 Jul 2014 23:39:04 +0000 (UTC)
Received: by mail-ob0-f181.google.com with SMTP id va2so15114obc.40
	for <multiple recipients>; Fri, 11 Jul 2014 16:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=LRW4Q54hDUOnzy9p03ngcXU+Y0IgQnxLJ1aoNiCgq6I=;
	b=uWBKhYSdZUG6jJ8D5gzV2GVfDGj81MWCK/yfn6We3nQ8knGCN86dVhlcNdrSVcUhSS
	65YeYHvorvEYfK9pFHkexybCOqpkovrtHTJowK1+dRTyS2EgDwbcwu216e3jHWxBJveu
	O2Xv0Hbfz2KohMPE/XqZyxzGViVvPToeg3abl0Jwja7uTQrNjc3ZfChh+jqqqXzHhH8C
	EDoPv0g18Sq2oSzVRzexWQfDeriBzZBg/vyzqBcjhssGt9xwF8hgXNd3eIIh7z8vzyCW
	zwrkJjb92KCv+R5+R7y5uAqjTMt4t78ohIO6DRbM7YPRM8kLqJ8BQtQU71bfP/yzoZHl
	BaVQ==
MIME-Version: 1.0
X-Received: by 10.182.19.196 with SMTP id h4mr2923992obe.20.1405121944623;
	Fri, 11 Jul 2014 16:39:04 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.50.135 with HTTP; Fri, 11 Jul 2014 16:39:04 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.11.1407101115390.10701@localhost>
References: <alpine.LFD.2.11.1407101115390.10701@localhost>
Date: Fri, 11 Jul 2014 20:39:04 -0300
X-Google-Sender-Auth: ms1ms8qxjogZBbMmfgq0QwKX9m0
Message-ID: <CAP9ODKq1vdW+eZ64gWGbSAygxfYkMCKwOAZGUOD-WntUN+azJA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] any value in keeping the backward compat "task-core" stuff?
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
X-List-Received-Date: Fri, 11 Jul 2014 23:39:08 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jul 10, 2014 at 12:21 PM, Robert P. J. Day
<rpjday@crashcourse.ca> wrote:
>
>   a number of the current packagegroup recipe files still have
> backward compatibility support for the old "task-core" names, seems
> like that's been there for well over a year, would it be safe to
> finally just toss that? seems like everyone's had enough time to make
> the move to the new names, and it would be clearer to not confuse the
> proper use of the word "task" these days.

I agree; however this question should also be send to oe-core mailing
list (added in Cc)

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

