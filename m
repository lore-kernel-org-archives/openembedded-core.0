Received: from mail-la0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1TPEzU-0007yA-9C
	for openembedded-core@lists.openembedded.org;
	Fri, 19 Oct 2012 18:00:04 +0200
Received: by mail-la0-f47.google.com with SMTP id h5so346287lam.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Oct 2012 08:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=kTziPaSGSnENSH3B15TnfokOppCp3ZrNGAqKv+5Fgsc=;
	b=KbuuY9JPzvf//Ros5YrdTIx4dsvEOiklTybXJMMPZJrIkotWQnYh/R1OJ87t4KKrRP
	JnkIYBrp+cRdB47rHwSP43HQtanMNX9m/Lg2KDQ+1WGoMfTaYXLXT5cjI1THJ2HMIfhF
	qOTTIZBuobI4eVCa4A4yr8QS5DTTY6qMlWAjQZTRXl5cRQREJegkOyVV1vQiCEFXb6q+
	tHy6IYrjPeW5wOXkCxGi7AlndG6SnuNu0/O220ox+hzsQDrCNWpK5UyUmBkrr4NoPazj
	+Vdl0jzd3gOffTKEgIblrvMU40MbdwgzYweLvdM2LQ32VUM9cC9FjuxVC/t6enR+llcG
	ZR8g==
Received: by 10.152.108.197 with SMTP id hm5mr1512901lab.45.1350661603224;
	Fri, 19 Oct 2012 08:46:43 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.114.1.49 with HTTP; Fri, 19 Oct 2012 08:46:23 -0700 (PDT)
In-Reply-To: <20121019153834.GA13159@mcrowe.com>
References: <20121019153834.GA13159@mcrowe.com>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 19 Oct 2012 08:46:23 -0700
X-Google-Sender-Auth: wlVoOW6q-GVe-GLXAXIBp7RJ30s
Message-ID: <CABcZANkWq0YZ38E9cCDvoJvpou0eunXJcHUUQCnbhRmDm_oQLg@mail.gmail.com>
To: Mike Crowe <mac@mcrowe.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Using SSTATE_MIRRORS with sstate subdirectories
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
X-List-Received-Date: Fri, 19 Oct 2012 16:00:04 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Oct 19, 2012 at 8:38 AM, Mike Crowe <mac@mcrowe.com> wrote:
> I'm having trouble using SSTATE_MIRRORS as suggested at
> https://wiki.yoctoproject.org/wiki/Enable_sstate_cache :
>
> SSTATE_MIRRORS ?= "file://.* file:///private/sstate-cache/"

SSTATE_MIRRORS ?= "file://.* file:///private/sstate-cache/PATH"
-- 
Christopher Larson


