Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SeluC-0000oE-Jo
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jun 2012 13:38:32 +0200
Received: from mail-qa0-f49.google.com ([209.85.216.49])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 13 Jun 2012 04:27:55 -0700
Received: by qabj40 with SMTP id j40so1221203qab.15
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jun 2012 04:27:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=3GQmagLIU1UoRblG1RQ9Ta+/90ud1T7PpIcCSVU7Fok=;
	b=eLnkK1dGuiB+aTKEQ2H6H2noEWjoU8+iWMILH7NJOhsvb9csagfdnSdIfwSCECG6RF
	nULRLyXS87g61c3rr+bRJHhs0bQfJ+dDw7W9st/gTo7aPXZOztn10+eP3fikQNMgnV42
	TR48V3qaQzlG0kyxCTx6BrTWsIky/q/WqF3RSpnJmNopl0X28jI99mTUe6F5W2NZkrr1
	YXlhYLXBJtYc/jM1Hv6krqx4m9X5RQahsZ0Y1P4094Jfz/yo2M4uKsg697lliyCFz3gV
	YQtrKyD//PPVxJGOKVaBNHzi9qHPGkBlRFyKBP14YcgKXuECuJk3rsa55c+3MfIQ/q4h
	OxsA==
Received: by 10.224.220.17 with SMTP id hw17mr11816345qab.89.1339586874282;
	Wed, 13 Jun 2012 04:27:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.251.142 with HTTP; Wed, 13 Jun 2012 04:27:34 -0700 (PDT)
In-Reply-To: <1339586425-702-3-git-send-email-laurentiu.palcu@intel.com>
References: <1339586425-702-1-git-send-email-laurentiu.palcu@intel.com>
	<1339586425-702-3-git-send-email-laurentiu.palcu@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 13 Jun 2012 12:27:34 +0100
Message-ID: <CAJTo0LZTTRp_myTPuMchRtE1ogwJ7UnZkxDcC2qSUUzNMvo4_w@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQkEiFgV5QajAqCGZxIgZmRGwa8exVPjd7aMNrKNh0hqpLCHbGm4WhLooZdhh0liw0R9P17k
Subject: Re: [PATCH v3 2/2] connman: make useradd parameters consistent with rootless X
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
X-List-Received-Date: Wed, 13 Jun 2012 11:38:32 -0000
Content-Type: text/plain; charset=UTF-8

On 13 June 2012 12:20, Laurentiu Palcu <laurentiu.palcu@intel.com> wrote:
> Both connman and rootless X share the same xuser. However, useradd
> parameters are not consistent and if connman runs useradd first,
> rootless X will be broken.

Looks good to me, and I'm running it on my test machine which was
reliably running connman postinst first.

Ross


