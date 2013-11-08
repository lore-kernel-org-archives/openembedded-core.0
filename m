Return-Path: <sakoman@gmail.com>
Received: from mail-ob0-f173.google.com (mail-ob0-f173.google.com
	[209.85.214.173])
	by mail.openembedded.org (Postfix) with ESMTP id F10A36D288
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Nov 2013 21:04:45 +0000 (UTC)
Received: by mail-ob0-f173.google.com with SMTP id wm4so2038724obc.32
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Nov 2013 13:04:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=t5UOzwTQ+c2GC14b3e+glYubjJeSg6GoY2e6twQoCTA=;
	b=Ro4VGE1NIk4tJmpuxgzGuUoDLZLIXBJuoz2lCKToLkLe6YbXRjUms6W3rAw5FRBJwa
	lIIRHEksuoU8hv1xGK+qq3WnSZ14PFFgoaKmdg0x0BeNKDHaDVLVjwyOcEscOJfV3xmR
	XEpS/zE19/R5sjfIchsGMkHXXOT2Rz3RfheGvOehs1pSJCQWqUbrjdy7Arfw6j7VyLF8
	teDJ9u+GVNH+JsyaaPU1vFEgB/Zv8sq7/S777bP/+kZ7Tv/dKnf2K8B9Ln9KlZB/EOfP
	iK/8V/jN/yP52E+muVcMW4rwPapOIzO2QfwgOM1DMQrl148ZSuBNTjffIinYM69/tn3+
	8oFA==
MIME-Version: 1.0
X-Received: by 10.60.42.203 with SMTP id q11mr2970819oel.54.1383944687059;
	Fri, 08 Nov 2013 13:04:47 -0800 (PST)
Received: by 10.182.120.201 with HTTP; Fri, 8 Nov 2013 13:04:46 -0800 (PST)
In-Reply-To: <1383944318-23406-1-git-send-email-steve@sakoman.com>
References: <1383944318-23406-1-git-send-email-steve@sakoman.com>
Date: Fri, 8 Nov 2013 13:04:46 -0800
Message-ID: <CAGDS+nkC94s7HPedu_5yq5+zy4wxqeA56-NadyxD1QkcJXCQ6A@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] wpa-supplicant: enable CONFIG_CTRL_IFACE_DBUS_NEW
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
X-List-Received-Date: Fri, 08 Nov 2013 21:04:46 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Nov 8, 2013 at 12:58 PM, Steve Sakoman <steve@sakoman.com> wrote:
> Without this option wifi support in connman will fail:
>
> src/technology.c:technology_get() No matching drivers found for wifi

This should be considered for dora since connman wifi support is
broken otherwise.

Steve

