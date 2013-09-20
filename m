Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f172.google.com (mail-ob0-f172.google.com
	[209.85.214.172])
	by mail.openembedded.org (Postfix) with ESMTP id 177BC6028B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Sep 2013 22:36:56 +0000 (UTC)
Received: by mail-ob0-f172.google.com with SMTP id gq1so1331910obb.31
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Sep 2013 15:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=1TfeJ2Cj9jUcYUnF4ja/y5rUAtiYf9dKhz5/MCqfJ/8=;
	b=PhJBo+J/5k/Xs0ZKqnqCIQR/FxeTi+k9Gc29lRoFRQynqquu1SVOCXcY0UuolL7WC2
	6cJBG/SRmp/wG1aGuSu91/cLT5+HhPT/B4wknlJN0pRCfVykw8B01nu/+M9O4wph+xRH
	MTGLYPGbDAsT2aa6Yv6ax6hfwkYv3Cf0HCrPN5Nc+FBafbMUnVzMpDhA0q+G19ZpQA8l
	3HoNm3Ozxl+izNiyWsXSQ6AMqvmGOLmVOCSzQohRQL3f+kA+7aNXJWHK6YSGdnuaQy87
	vw92/mZfTyLskI6td1qMrUEpYFzXmXTlWAUgB1DRx3IJroxHtWOkQldHRG/0fg1Wldhf
	oRjw==
MIME-Version: 1.0
X-Received: by 10.60.60.5 with SMTP id d5mr7925261oer.0.1379716617428; Fri, 20
	Sep 2013 15:36:57 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Fri, 20 Sep 2013 15:36:57 -0700 (PDT)
In-Reply-To: <1379682086-27877-1-git-send-email-paul.eggleton@linux.intel.com>
References: <1379682086-27877-1-git-send-email-paul.eggleton@linux.intel.com>
Date: Fri, 20 Sep 2013 19:36:57 -0300
X-Google-Sender-Auth: fo-N5J0zwM6EQJgipnjICwGppo0
Message-ID: <CAP9ODKo3iBg=Gou6E3Ve5vRHK7dZF7qBFdXi=3nw-QYDO4hHvA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qt4-x11-free: disable QGtkStyle
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
X-List-Received-Date: Fri, 20 Sep 2013 22:36:56 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Sep 20, 2013 at 10:01 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> This currently leads to a floating dependency on GTK+. Since most users
> in an embedded context won't need this, just disable it by default.
>
> Fixes [YOCTO #5116].
>
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>

Personally I use the QGtkStyle in some products but I am all in favor
of this. This avoids floating dependencies and I can easily re-add it
back in our internal layer.

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

