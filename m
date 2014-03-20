Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f54.google.com (mail-yh0-f54.google.com
	[209.85.213.54])
	by mail.openembedded.org (Postfix) with ESMTP id 2D6C36E87A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Mar 2014 20:59:42 +0000 (UTC)
Received: by mail-yh0-f54.google.com with SMTP id f73so1505435yha.41
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Mar 2014 13:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=3R3h5tYoWAIIJAynYiDVwIWvA7J7BEjEqcD5f7IgL4o=;
	b=wYAGWLID1mFpvYFlmO5nP2BUE5sYC52NluoRcmtd0lRWVkGz0w0qia5pHZFVYX4c+D
	GloRs6J2em8d6fCHefro/DrPm9R6LllUEPB1qdb3fvOAJurr1Mx8RWKdh7cXYvNVRLps
	F3qebkaacYsCvcBm7uLHbGL2WSJboaRxDdyOt2Q7/86HKDYg6IZuE6U0nB0RqxHM7zwT
	Vo4N/TeTCrSqkjd6mFsIoDCJejO50NF/lCCkOknO/32RI35U0izKqrgvxPOfWbICEt+/
	Tiqb+elsAVb59sZ9pVoL5qbQe0tCAV4XzvlMYPBrMqEEMs065yGHI886JlRKUmxaMezh
	sBag==
MIME-Version: 1.0
X-Received: by 10.236.202.18 with SMTP id c18mr21094699yho.117.1395349183181; 
	Thu, 20 Mar 2014 13:59:43 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.124.72 with HTTP; Thu, 20 Mar 2014 13:59:43 -0700 (PDT)
In-Reply-To: <1395156450-7172-1-git-send-email-simone.agresta@bticino.it>
References: <1395156450-7172-1-git-send-email-simone.agresta@bticino.it>
Date: Thu, 20 Mar 2014 17:59:43 -0300
X-Google-Sender-Auth: 3mYmz2Aiu9pH7MpknJvdGAsKwW4
Message-ID: <CAP9ODKpUD+nb34t_MdOWz8b9kBJHp+kdRBc2fPrNN-rF14DBfw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Simone Agresta <simone.agresta@bticino.it>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] alsa-tools: fix build when x11 and gtk+ not available
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
X-List-Received-Date: Thu, 20 Mar 2014 20:59:43 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Mar 18, 2014 at 12:27 PM, Simone Agresta
<simone.agresta@bticino.it> wrote:
>  Updated patch to work with alsa-tools version 1.0.27
>
> Signed-off-by: Simone Agresta <simone.agresta@bticino.it>

This still keeps the option floating so please add an enable/disable for it.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

