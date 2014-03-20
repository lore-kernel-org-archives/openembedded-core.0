Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f174.google.com (mail-yk0-f174.google.com
	[209.85.160.174])
	by mail.openembedded.org (Postfix) with ESMTP id 93EF36E6FC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Mar 2014 21:09:44 +0000 (UTC)
Received: by mail-yk0-f174.google.com with SMTP id 20so3837890yks.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Mar 2014 14:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=Yo+23Id7yBzIyjIB2Vie9v2DtWKeg7SnPXhXrD+JnNI=;
	b=wmddcI82eCG4FKuTwhdDzc+rj+Cg4CmoeIRa2iUHJzwhNe9w5ih24fTEpysSglvjxg
	SpEeSKbJ2Wh+SCVNkn2ASytX7KTEhS5WKp2B9ELe3KmfzDwpjbfbDe5lbMfWQXLm/wQo
	4vb59Z1/+yiGBiXGcFEBDU9xuyHoQ0OYazce6Cc8/Oi9/Mef3Eirei1rfV5ILT7QfXJC
	tc0oCQ+8NJjSxT6ZqOYYshPU5XxG9V/1okJk13Xr8O1NGH5yM21VdMTNsGtsP+nJm4FI
	8s9hjXvO4gOX7zgQQML1SKDRAr1NflK5u8kS6fcFOLrmCNXrj7tBfqsucVRj++K2FM8H
	nRkQ==
MIME-Version: 1.0
X-Received: by 10.236.151.83 with SMTP id a59mr5304269yhk.48.1395349785897;
	Thu, 20 Mar 2014 14:09:45 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.124.72 with HTTP; Thu, 20 Mar 2014 14:09:45 -0700 (PDT)
In-Reply-To: <1395349598-951-1-git-send-email-trevor.woerner@linaro.org>
References: <1395349598-951-1-git-send-email-trevor.woerner@linaro.org>
Date: Thu, 20 Mar 2014 18:09:45 -0300
X-Google-Sender-Auth: wXWthSymoSWgKGj6pxZYzNUHdbA
Message-ID: <CAP9ODKrFkU-qREH43CBWvjSTFQiXo+Zp9AS2nXh0ti6DEKnC4Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Trevor Woerner <trevor.woerner@linaro.org>
Cc: patches@linaro.org, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] core-image-minimal: allow user to set size
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
X-List-Received-Date: Thu, 20 Mar 2014 21:09:45 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Mar 20, 2014 at 6:06 PM, Trevor Woerner
<trevor.woerner@linaro.org> wrote:
> Allow the user, in their local configuration, to override the size of the
> final image. This is useful when creating an image for (for example) an SD
> card and the user wants the image to fill up the card as much as possible.
>
> Signed-off-by: Trevor Woerner <trevor.woerner@linaro.org>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

