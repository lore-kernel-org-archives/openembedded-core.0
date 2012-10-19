Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1TPDyk-0006Oh-HG
	for openembedded-core@lists.openembedded.org;
	Fri, 19 Oct 2012 16:55:14 +0200
Received: by mail-lb0-f175.google.com with SMTP id y2so354563lbk.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Oct 2012 07:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=SOwTOemwou19HrWWvJApDihwGj+p31gOt4/wF7faZvA=;
	b=ii3ytQTVnKuuEDq2rG7/Z+ak1PFuHWc0RyNlvtvXgJzCejFG9dHt/fRZUbxM35vAzr
	hVVCuASf+i2IfhFD4vrVGZbK1L4iWIFe7IMpUD8Qt6qVAzmq/u/skrTa9mLMVLzTHihR
	3LC9FJ0pi2gsTMT4AAYcPNQl+MpA/Ugx73dKmxQ0DkUSLMVz39EZq/zL1VgG0VHNEPir
	YuGsHgRpND7u9I+1gsGh4c90m2e3MCKPo2juDvt43XEi9xzcT5jC6lbXYh1S1xW6nDBz
	BljtDrfJtnNi0JozoO79PdSmvwVJGw94igEjRxIn477+ZL8xCybYpmTxigvV803K3hzS
	iGDQ==
Received: by 10.152.148.169 with SMTP id tt9mr1415361lab.15.1350657713173;
	Fri, 19 Oct 2012 07:41:53 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.114.1.49 with HTTP; Fri, 19 Oct 2012 07:41:33 -0700 (PDT)
In-Reply-To: <1350588305-16854-1-git-send-email-sgw@linux.intel.com>
References: <1350588305-16854-1-git-send-email-sgw@linux.intel.com>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 19 Oct 2012 07:41:33 -0700
X-Google-Sender-Auth: bF8jM_g6tLbAHRI-FyR_MTYdugU
Message-ID: <CABcZAN=2FQMUVzrteOh48Of5yRb3SkwyuDWD0AaW_3RaQm=Ntg@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] sstate: add manifest info for shared file matches
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
X-List-Received-Date: Fri, 19 Oct 2012 14:55:14 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Oct 18, 2012 at 12:25 PM, Saul Wold <sgw@linux.intel.com> wrote:
>  # Avoid docbook/sgml catalog warnings for now
> -SSTATE_DUPWHITELIST += "${STAGING_ETCDIR_NATIVE}/sgml ${STAGING_DATADIR_NATIVE}/sgml"
> +#SSTATE_DUPWHITELIST += "${STAGING_ETCDIR_NATIVE}/sgml ${STAGING_DATADIR_NATIVE}/sgml"

Was this block of the patch intended? It's not mentioned in the commit
message, that I can see.
-- 
Christopher Larson


