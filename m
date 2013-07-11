Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f48.google.com (mail-vb0-f48.google.com
	[209.85.212.48])
	by mail.openembedded.org (Postfix) with ESMTP id 5B3F76AECA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2013 10:23:05 +0000 (UTC)
Received: by mail-vb0-f48.google.com with SMTP id w15so395076vbf.35
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2013 03:23:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=9cN4VaVG1Z5wWjuBENTyVvE/rEtuQU4fvYdSHbr9Hpc=;
	b=iAj0B9ftu19rdZFVXil2N4Fkno+uCfrrbwf7cCJ4N7nxFPwvRLYfjOr1uf3oZp9hO7
	HmwAlu30sexmiyExHU3NLgcWDUzLo4q+mxQNxXXvDPRaiTtk3moj5ybmOffpMz2AW1CB
	Wa63RsztImjkODK//MWtzTPZqvrgi6nlLGDxkhZ0Z2e8f4o30lXLuW8KHbRpeFesZL8r
	/rea5IKelfJCNa070KdtRGZ3Icj5t1d9xdSsKpSq70hvkEbUmFkT6WiAhtInPHoTF7yB
	Fwl0Vh1+ufHAY7rOkcfB/9MvA/vu/C889lA2GLF1DCyrcYMjD5xFZJMYp72e1VmYhUCt
	40+w==
X-Received: by 10.58.24.41 with SMTP id r9mr21028165vef.44.1373538185953; Thu,
	11 Jul 2013 03:23:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.13.144 with HTTP; Thu, 11 Jul 2013 03:22:44 -0700 (PDT)
In-Reply-To: <7987269.Ko1Y7S2dO1@helios>
References: <cover.1373359791.git.emilia.maria.silvia.ciobanu@intel.com>
	<7987269.Ko1Y7S2dO1@helios>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 11 Jul 2013 11:22:44 +0100
Message-ID: <CAJTo0LYZ9i7f-orQ7z0ZybGwmkmvT2G7n1xY-SAwP=sj5bqMpw@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Gm-Message-State: ALoCoQlsSmYE/my5ixtpzF2fomDvwvjphJjXkiTB2o7FG0B5EU5a+uyHIsExr3GWLofL0rzhLB4e
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/4] Fix typos
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
X-List-Received-Date: Thu, 11 Jul 2013 10:23:05 -0000
Content-Type: text/plain; charset=UTF-8

On 9 July 2013 10:43, Paul Eggleton <paul.eggleton@linux.intel.com> wrote:
> However, if it would help with the package
> reporting system, the recipes could be changed to convert PV of "6.0" into
> "60" in SRC_URI using some inline python.

Oh, somehow I didn't see Paul's reply.

This is basically what happens already:

SRC_URI = "ftp://ftp.info-zip.org/pub/infozip/src/zip${@d.getVar('PV',1).replace('.',
'')}.tgz"

Ross

