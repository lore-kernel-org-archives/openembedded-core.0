Received: from mail-ob0-f179.google.com ([209.85.214.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UaUi3-0002Vo-T3
	for openembedded-core@lists.openembedded.org;
	Thu, 09 May 2013 19:32:57 +0200
Received: by mail-ob0-f179.google.com with SMTP id xn12so3150145obc.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 May 2013 10:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=3029MwMRe2yCq33was+Bi0NVNQKU3fpmaS+FJIhW2HY=;
	b=kOqpCjtbL6+XJD6huxfk16LQue4YMPVbNHWFzzmmgOK+/9HCdYh97d1WcjJDBKvneQ
	/yXWxqQyAr3a/W+Dgmsrb3oEmAvUzAvAyyC6sEgqL6iGx/rJbEzlx2Hl4zAe5PO3ojTN
	qK0PybmFmhDUGzr/ukW6SexD5Lc4aftadPBAXS1LBaiVHyrVrvDBc1Z3sAXuUtHj7U3C
	x2TT1dlj+mlL8OGe4NkdnfCLNebMwn0YDt1ckN0ropzgx3oNzgC+mpq4KGXXNYCN45yP
	oJ7VQukAxrKBg7PlgQKmSu0+DPXcbxIc+ucFaiV/Hwno6/MxLGMUv0sAe3YFL25CQ2AD
	5T+A==
MIME-Version: 1.0
X-Received: by 10.60.35.197 with SMTP id k5mr4772197oej.138.1368119686987;
	Thu, 09 May 2013 10:14:46 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.89.226 with HTTP; Thu, 9 May 2013 10:14:46 -0700 (PDT)
In-Reply-To: <04c56775ed2d60a9affcf46cf10fdaee455786bd.1368115039.git.paul.eggleton@linux.intel.com>
References: <cover.1368115039.git.paul.eggleton@linux.intel.com>
	<04c56775ed2d60a9affcf46cf10fdaee455786bd.1368115039.git.paul.eggleton@linux.intel.com>
Date: Thu, 9 May 2013 14:14:46 -0300
X-Google-Sender-Auth: 1BMi40bs23vFBA0WMEd-2BZvpkM
Message-ID: <CAP9ODKrqakwSop296a6_5E0bRdhSgfOuyOrGjSnj=z6xJE=Kag@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] classes/buildhistory: track contents of selected files in images
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
X-List-Received-Date: Thu, 09 May 2013 17:32:58 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, May 9, 2013 at 12:57 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> Add a BUILDHISTORY_IMAGE_FILES variable specifying a space-separated
> list of files within an image to copy into buildhistory, so that changes
> to them can be tracked. Typically this would be used for configuration
> files, and by default this includes /etc/passwd and /etc/group, but the
> user is free to extend this list by setting the variable in local.conf.
>
> Implements [YOCTO #4154].
>
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>

This is awesome :-) Thanks by looking at it.

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


