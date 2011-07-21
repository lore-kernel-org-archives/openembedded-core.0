Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Qjvd8-000784-Ne
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Jul 2011 17:57:42 +0200
Received: by pvf24 with SMTP id 24so1228887pvf.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jul 2011 08:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=yx8GRLBS97gFdrFvGgwHcTZLopJEzcvZcEDq+OnG/l4=;
	b=UfjXzgQFMYIAIiKqNMKfFf94w6j8i3XydZjaMRazppJYQrrIJAtlhIpTeJT3kdbse7
	TokUOm+iG6wMpbzT4eub2c8Y140CZ0Uf73PCMDQ9U6SBLS6siinGrQv12J2WIjjenT4/
	Cv9MItEND7mHyvF2czJLe3FJxJItkYQRdUEak=
Received: by 10.68.2.103 with SMTP id 7mr482949pbt.211.1311263614087; Thu, 21
	Jul 2011 08:53:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.62.36 with HTTP; Thu, 21 Jul 2011 08:53:03 -0700 (PDT)
In-Reply-To: <20110721081209.GA3423@rhein.zuhause.netz>
References: <1311228617-29732-1-git-send-email-raj.khem@gmail.com>
	<1311228617-29732-3-git-send-email-raj.khem@gmail.com>
	<20110721081209.GA3423@rhein.zuhause.netz>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 21 Jul 2011 08:53:03 -0700
Message-ID: <CAMKF1spt2VpRKBZUB5tNc-vjxtX-F6OmJ7dWnagqEF7Rti=D8w@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/6] libiconv: Fix build failure on 1.13.1
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Jul 2011 15:57:43 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jul 21, 2011 at 1:12 AM, Henning Heinold
<heinold@inf.fu-berlin.de> wrote:
> Hi Khem,
>
> what was the reason to patch out the libtool-macros instead of deleting them? That would be
> reduce the changelines a lot.

I had some problems building but it was long time ago when I did that
patch. I can try and see
if that helps. It certainly would be better.


