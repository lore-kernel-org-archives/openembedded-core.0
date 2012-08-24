Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T51Lf-0006jb-DG
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Aug 2012 23:23:23 +0200
Received: by eekb57 with SMTP id b57so714798eek.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Aug 2012 14:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=EahdBO4dsuJqr9pxuqCDAvTZiQG9yWJkfdhlX6XYikg=;
	b=u3dESPf+vjOGSfN/DSt9TNTKEaHe0hem3ucWNwWxA/BFvPqyANS6Kx9dQhWYSf7Zoh
	CBBoBBT+F6C5UULfARdoKCr/SpmTUNfjceO0DM9nf/f8eolYCt3dt3ExpAe7B3A3yS05
	jo1S9ukc6G8vYHWAAj6mFykEOepMkyIX2GOWxVDFuTnMO1vm7Dyk6mVXMJ3VF8kjopsA
	6/ppDVwd9uPfMI8+8sKKgRhi2Ea7QOS2v7OwmuOKLN+d4Md3c9Y7801VE8Pk1iN9tvDN
	1nO/FNXG4cOmgsAfvYeL16lYX6IKz/JOzPz9Lxex5u5QoAqiXcb1fkIV3lAufV5qSN/u
	6R6A==
Received: by 10.14.5.67 with SMTP id 43mr9193604eek.15.1345842675463; Fri, 24
	Aug 2012 14:11:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.5 with HTTP; Fri, 24 Aug 2012 14:10:45 -0700 (PDT)
In-Reply-To: <48919519-8CA2-41A8-96EA-F5D7F91DE33F@gmail.com>
References: <7dacdb4ffd32fe781e4cd0c54b428cf86b96b693.1345518098.git.raj.khem@gmail.com>
	<8a3cf0ce40dbc72a43f08bfed56e61569fe7a910.1345518098.git.raj.khem@gmail.com>
	<48919519-8CA2-41A8-96EA-F5D7F91DE33F@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 24 Aug 2012 14:10:45 -0700
Message-ID: <CAMKF1sou8jjkoktbC4J1O+b-KbxZ43MyF3aPq68S74p8wC_qwQ@mail.gmail.com>
To: Elvis Dowson <elvis.dowson@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/9] gcc-cross: Make gcc-cross-initial as the only intermediate gcc stage
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 24 Aug 2012 21:23:23 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Aug 24, 2012 at 2:08 PM, Elvis Dowson <elvis.dowson@gmail.com> wrote:
>
> I'm adapting my earlier gcc-4.5 recipes, to try and get them to build with
> the latest poky master.
>
> I'm using eglibc-2.13, so it is possible for this version to drop the
> gcc-cross-intermediate stage, or is it only with newer eglibc versions?
>

well it wont work with anything older than eglibc 2.16

> At the moment, I've made the required changes to the gcc-4.5 recipes, to
> match that of the current gcc-4.7 templates, and deleted the gcc-4.5
> intermediate recipes.
>
> Right now I get a compile error with eglibc-2.13, as follows:


