Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f178.google.com (mail-ob0-f178.google.com
	[209.85.214.178])
	by mail.openembedded.org (Postfix) with ESMTP id 3E63F6CFEC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2013 19:13:57 +0000 (UTC)
Received: by mail-ob0-f178.google.com with SMTP id va2so4780847obc.37
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2013 11:13:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=veZTTyAN8e5TXH82eCV6BcPjHiQpyjzHpuzajKNKzjY=;
	b=y+Vm8A/sYkRoEM8sLJlBGvy+K1lhMBMarKtz6lX0qrF4WrGREutdKIY4PAyo57bqDo
	v1PLth2tYO5lSK009sBJASsbafNxboWjmaJQWaHDMdWKl/tqhR0we4bhyzSI7roJEttP
	tBF0c/r4rboIsPgUwGAnWZfKYaLA3qcgxX4L85pigvkgon8+yrlo5/w9ljg76BcNBqRG
	767PsgRb+sTWeQLk1b1Mu95+NMr7kKHDaJ2M8GswV0PfcT1ufEfPDBoTTLs/uViieI5/
	XeAoRqtS+63OvEi8VqMvQZibP3ePNlIJXs5f6JQNTKy5X2Oqz9oVDaZoQHgi4eykazJ7
	PVzQ==
MIME-Version: 1.0
X-Received: by 10.182.104.130 with SMTP id ge2mr26677917obb.6.1384197238735;
	Mon, 11 Nov 2013 11:13:58 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Mon, 11 Nov 2013 11:13:58 -0800 (PST)
In-Reply-To: <1384172473-23158-1-git-send-email-ross.burton@intel.com>
References: <1384172473-23158-1-git-send-email-ross.burton@intel.com>
Date: Mon, 11 Nov 2013 17:13:58 -0200
X-Google-Sender-Auth: 7ceDmps3_Mznf5NMCqFJ5wkaaIU
Message-ID: <CAP9ODKo+9CBj-pzALdSUMYn8FXLs-4JU5msJRZazMOqpzo-7_A@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] core-image-weston: add SSH and hwcodecs to the image
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
X-List-Received-Date: Mon, 11 Nov 2013 19:13:57 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Nov 11, 2013 at 10:21 AM, Ross Burton <ross.burton@intel.com> wrote:
> core-image-sato has these by default so add them here too.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>

I don't think the right image to compare here would be sato but maybe
core-image-x11; I agree about hwcodecs - as we need hw acceleration
and like - but ssh seems overkill.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

