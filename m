Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TfWhk-00084t-IA
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Dec 2012 15:09:24 +0100
Received: from mail-ie0-f197.google.com ([209.85.223.197])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 03 Dec 2012 05:54:41 -0800
Received: by mail-ie0-f197.google.com with SMTP id 16so12856709iea.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Dec 2012 05:54:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=oKQQ/WzNmOdeL9dIWuUdOtbOvTYqTyTEpuh8macFBsQ=;
	b=SRUj7UHKWDUpl+LHKP7CEbA1N1EAO9XOr7cTUCSkoW2yb0SH68nZ7ogwZOSQSJrAb8
	CAevchzWxNuKWnOB/NH9+r7VQILuwvDm+STzMZDRNAougSeeEQySGH2A2ZsIc2PVPSmG
	tLouhNrtbm3B0jU6aD6ilxE7sAih3CovvhWvw0xApo6kL+Z7nwWPfLmh8D6NgIRrkmmc
	wdud7cgwWp15wJK5SNmtOlWPc25OF5f00tATiZhPH/liZEdRiyk6MPc4z7pD4QRMxpNG
	DUsaAR59cPS9LMkc4P8RFIOkT6+txxX5j7aO9gY/Qgf4ukDdhSw6FRaAnnLSqKZb30F0
	kmTA==
Received: by 10.60.1.169 with SMTP id 9mr8055327oen.93.1354542880639;
	Mon, 03 Dec 2012 05:54:40 -0800 (PST)
Received: by 10.60.1.169 with SMTP id 9mr8055321oen.93.1354542880528; Mon, 03
	Dec 2012 05:54:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.132.198 with HTTP; Mon, 3 Dec 2012 05:54:20 -0800 (PST)
In-Reply-To: <50B93513.4020209@linux.intel.com>
References: <50B93513.4020209@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 3 Dec 2012 13:54:20 +0000
Message-ID: <CAJTo0Lafx8m-UqsSNx_Su5N0_zAxvrYZGxMb+9t_pysrRQrTZA@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
X-Gm-Message-State: ALoCoQl7oJzKqDiRN2tgzDIWxB3GImSICZl8EM4q9FOW+v6qVOKN2Lf37fiPlQY5s0Z+wfpmG5u7V0RrQ56/LH9IBJnVRJDvlp6EMecG2lRpEI8SRKnYtB+Z8X/mw91+HIWnjbVkWAMO0y07cXzxzfpVcQ1aHCXicPaj5tclqPMMzHpjWs46updRV2+Sbxf44MuFS2pVnmjD
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Danny - backport - gst-meta-base x11 fix
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
X-List-Received-Date: Mon, 03 Dec 2012 14:09:45 -0000
Content-Type: text/plain; charset=UTF-8

On 30 November 2012 22:37, Saul Wold <sgw@linux.intel.com> wrote:
> Since we have a fix in master (1.4) already for this, we should just
> backport it.
>
> OE-Core: 6e44bf71fd4645ea09b3e34b907b17e92b5225e3
> Poky: 115076c0d8fa0e9f100136b8f060e59d978c4fca

Without any other changes, doesn't that mean that ximagesink doesn't
get into the images anymore?

Ross


