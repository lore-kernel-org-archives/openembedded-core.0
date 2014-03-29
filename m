Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f44.google.com (mail-yh0-f44.google.com
	[209.85.213.44])
	by mail.openembedded.org (Postfix) with ESMTP id B54D46B7AF
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Mar 2014 20:05:16 +0000 (UTC)
Received: by mail-yh0-f44.google.com with SMTP id f10so6305786yha.31
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Mar 2014 13:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=CxYJdZ2IEyMnKMwGBVxG7LbvKdha7H7SK0zmIkl2aZA=;
	b=SP5sn8YphW+9yM+Zg9X/7wimdnnpdrN1pBGmzZ5IBOAxEnyQ1oSQYA0OzXHJs8o9Xc
	AqvSVj7JpkMy3AgPkGYJhhZqQaKmN5o9gpz8gDLnVkY8OnyB/59SMCRFT8mhAWGdhcT4
	ItoOxzmcHNesTsra/pzs+vVgJc2ZDnb9TJTE8bSOO59RPyZMww/q35sx1Ljmbr+UZ5oa
	5nk+Mrgh+7Sj5NyjxF1oZhXMs7vRgUYth1AAGN/HJ8zHMaPXPPRwHGCiDWAEE/0XQmV2
	rqrAmZF6yt+Ci7uB6cAL11cTIY+3TTQ6YjqRsuP/qjT32gbGMyTd85oTGzJd3N0K/RQK
	lXYw==
MIME-Version: 1.0
X-Received: by 10.236.137.8 with SMTP id x8mr22942050yhi.4.1396123517323; Sat,
	29 Mar 2014 13:05:17 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.124.72 with HTTP; Sat, 29 Mar 2014 13:05:17 -0700 (PDT)
In-Reply-To: <1396122742-27434-1-git-send-email-otavio@ossystems.com.br>
References: <1396122742-27434-1-git-send-email-otavio@ossystems.com.br>
Date: Sat, 29 Mar 2014 17:05:17 -0300
X-Google-Sender-Auth: QAOnYtiJ4zTcQsc4lYXwnf_t3Ns
Message-ID: <CAP9ODKoYWhxy_GWwTUn00Qq=MEUA8d948vvRcnXWq_JV-HyVZA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [PATCH] packagegroup-core-tools-testapps: Move piglit to X11TOOLS
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
X-List-Received-Date: Sat, 29 Mar 2014 20:05:16 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Mar 29, 2014 at 4:52 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> piglit currently depends on libx11 for build so is not buildable in
> x11-less distros.
>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

Discard this one; I sent a v2.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

