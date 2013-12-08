Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f175.google.com (mail-ob0-f175.google.com
	[209.85.214.175])
	by mail.openembedded.org (Postfix) with ESMTP id 0A6D56DEEC
	for <openembedded-core@lists.openembedded.org>;
	Sun,  8 Dec 2013 11:42:19 +0000 (UTC)
Received: by mail-ob0-f175.google.com with SMTP id uz6so2597727obc.20
	for <openembedded-core@lists.openembedded.org>;
	Sun, 08 Dec 2013 03:42:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=1Vb+SRWVh+IttQ+h88Qe3pSbCamvuHcVmcoOxlb7hN0=;
	b=rTL0zRkuaJm5n6WjcyD4qnHIL9TKK9o99dXbmj2CPiQJtBZ5BAPehyeCLg4JWxelfW
	J4OSekAP4wpWwD/xwjki2SdFLYLpNfDxzY4l6SQ04UvjuZbwc4A0F3obH/4irM90c7RN
	//oAsS++o+R9qyJiBFVXbmPNFwxnCmdcLNMdF4VWfwOYcJTMwt5e7Y6+S6u1BiZ+cIEM
	fGf+mg2mJ3gi1E1343h5UgWPCOoKg5acsn/A762Zsx2VpAbBuLrHTLsOx3fJc+xn7xww
	uYYV/OZhjp+7VekgdLQXsURCBQD1A7zcY/LvNDjkTBLtgmlvUVlZ1S4HErHOFywv3/4+
	5lZg==
MIME-Version: 1.0
X-Received: by 10.60.44.239 with SMTP id h15mr9275257oem.22.1386502939139;
	Sun, 08 Dec 2013 03:42:19 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Sun, 8 Dec 2013 03:42:19 -0800 (PST)
In-Reply-To: <1386439921-11748-1-git-send-email-andrei@gherzan.ro>
References: <1386439921-11748-1-git-send-email-andrei@gherzan.ro>
Date: Sun, 8 Dec 2013 09:42:19 -0200
X-Google-Sender-Auth: qXHuA3elrLg8hghmLtNPV8c3UYE
Message-ID: <CAP9ODKrK7e_TT84ZcW=ruiSCsdbGmgKkbpZum-sevn=mVTqZTA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Andrei Gherzan <andrei@gherzan.ro>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V3 1/1] libav: Add v9.10
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
X-List-Received-Date: Sun, 08 Dec 2013 11:42:20 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Dec 7, 2013 at 4:12 PM, Andrei Gherzan <andrei@gherzan.ro> wrote:
> This version includes libavresample needed for packages like xbmc.
> To use this version add:
> PREFERRED_VERSION_libav = "9.10".
> Removed git version as being an older version of a 9.X release.
>
> Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>

Any reason to keep the old version? why not move to this release?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

