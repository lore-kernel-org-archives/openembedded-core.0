Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1SAkVj-0004bL-Cw
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 17:05:11 +0100
Received: from mail-pb0-f52.google.com ([209.85.160.52])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 22 Mar 2012 08:55:10 -0700
Received: by pbcuo15 with SMTP id uo15so7598034pbc.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2012 08:55:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=O1FCEcfphE+QntROlDLrqFsgXqotYUDZrGprbUcwj1U=;
	b=EsaEOBTKvVO5Q2zWaqxlNr+BO6SyGrntA5MaSIF5HveK2XhB5N6LTbYDmnYgoggi13
	ZgpH9UlT2ODU1nQ8VKir2hS4L75G873pskrjNBIIN6khQ7jQp3q7o48qVsE/tLs0BHiC
	UQJyPz7I5a6i68d0Rw6AFAr9pz9JxlaH3oRtCoUIil7WaVK5sI2oIcfqlSEhbk3c7yCA
	5teMkGlRaSRVD+GHg312JiSqrS4qLC9eSRwZ0Ywn+qX3Kclw834uHpYCEYf+3jdPnEFu
	mDci2CA88eD9h2pU9OjpHWRkA/zgxLWdtYweYcj15iYH6Gv3W1i/nWjQQibqlqJAQq4T
	hP4g==
Received: by 10.68.217.201 with SMTP id pa9mr2102594pbc.73.1332431710333;
	Thu, 22 Mar 2012 08:55:10 -0700 (PDT)
Received: from [127.0.0.1] (masterfoo.zenlinux.com. [207.192.74.254])
	by mx.google.com with ESMTPS id x8sm4050668pbr.11.2012.03.22.08.55.07
	(version=SSLv3 cipher=OTHER); Thu, 22 Mar 2012 08:55:09 -0700 (PDT)
Message-ID: <4F6B4B51.3080806@intel.com>
Date: Thu, 22 Mar 2012 08:54:57 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120310 Thunderbird/11.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <alpine.DEB.2.02.1203220731420.16149@oneiric>
In-Reply-To: <alpine.DEB.2.02.1203220731420.16149@oneiric>
X-Gm-Message-State: ALoCoQm3RgaEzhmE8c+Kb2eufIQr5JB8oM0tjeqU8wEPRnRoGcLYOVwumE7Rq58+UU1w3FE3bXe+
Subject: Re: proper way to bounce between two (or more) build directories?
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
X-List-Received-Date: Thu, 22 Mar 2012 16:05:11 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/22/2012 04:42 AM, Robert P. J. Day wrote:
>
>    haven't seen this mentioned anywhere and i know it's simple but i
> want to confirm this.
>
>    say i run oe-init-build-env to initialize a new project, part of the
> effect of that is to prepend the OE and bitbake related directories to
> PATH.  i work there for a while, then want to put that on hold to
> start a second build.
>
>    i rerun oe-init-build-env to set up that second build, which works
> fine but, unsurprisingly, that prepends the OE directories to my PATH
> *again* (but i really have no choice, it has to be done).
>
>    after a while, i want to go back to the first project.  am i
> expected to run oe-init-build-env yet again?  (prepending directories
> yet again?)

I would generally do my best to avoid working with multiple build areas 
in the same terminal, and it's definitely not a case we test with.

>    as best i can tell, the only change i need to make in switching
> build directories is to reset the BUILDDIR env variable.  is that all
> that's necessary?  i don't see anything else in my environment that
> would have to be reset.

Compare your env before and after running the oe-init-build-env script, 
then prepend something to unset the variables that were added.

If you want to submit a patch make the oe-init-build-env script 
idempotent in this way, that could be useful.

cc: to Beth in case there's something weird we do with our autobuilder 
environment that she would want to comment on.

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


