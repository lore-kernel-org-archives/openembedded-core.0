Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TyOPp-0004EQ-Ei
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Jan 2013 16:08:33 +0100
Received: from mail-gg0-f199.google.com ([209.85.161.199])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 24 Jan 2013 06:52:58 -0800
Received: by mail-gg0-f199.google.com with SMTP id v5so10089291ggn.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2013 06:52:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=suQgBo0DKbKql13Han19p71ryXPGaQ6S/Vrl6DCjpAU=;
	b=XT5n9pheEIBN0iX87FaPYUPuvx3vIeGd5uK3IKGi/w1Ja26nYpAW0e6hQiv3gZNb3I
	U+SCU07Y1HOBkV5H/h00O86NJCLImq0YMIZX76eFBPOGm34piD1bkCmXsNtwKQZkbhl8
	pl7b83n01ywRJ8Yqq//DHEX3Zp9vs0D8Gel/4A9rFc+ZjgoQ2FwcVoIgWNEbiq5+k7mN
	bwsjpS3Yai5oaUy83YApenTSIkQbZqPu5K3wbfwcClElbWVljtp0QV/CIzXgNOerKSEB
	BxZ7wkohoBexT5WLDtvKlPClH5A8vgEspZPRpUEfNtiFZTcIj52Y92thDTqn7gWJZoLt
	iiAQ==
X-Received: by 10.52.68.4 with SMTP id r4mr1892419vdt.15.1359039177730;
	Thu, 24 Jan 2013 06:52:57 -0800 (PST)
X-Received: by 10.52.68.4 with SMTP id r4mr1892414vdt.15.1359039177575; Thu,
	24 Jan 2013 06:52:57 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.151.207 with HTTP; Thu, 24 Jan 2013 06:52:37 -0800 (PST)
In-Reply-To: <51013136.7040807@intel.com>
References: <50FFFF81.8010203@communistcode.co.uk> <510102F4.70108@intel.com>
	<CAJTo0LZfGGSdQwKMshr8PNUVZfk4Nwhr67-9iFbGw2=V=YqN8g@mail.gmail.com>
	<510124FE.6040901@intel.com>
	<lyd2wug4c0.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<51012A68.806@intel.com>
	<ly8v7ig2td.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<51013136.7040807@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 24 Jan 2013 14:52:37 +0000
Message-ID: <CAJTo0LZ2ox=zgiAHS=DnbF9cv+vofjZpbqy8i0KEa6t1gezJPw@mail.gmail.com>
To: Radu Moisan <radu.moisan@intel.com>
X-Gm-Message-State: ALoCoQm33yKwUTGYFBZ/RVTXIRFmr2yY5xEKBjaXY9cRCZzlKrEp1dwQw/uwbfwYFnLocmgYPQHjbqv6XD5ghPianJDClvUXqKnmV9sU+bQrCwdihNEMHiaqLDfi5JxouRQUTcdoPHW0rOfjJIVFWvrPH4/I2cE1LIhq/O5o+QPHoYLER7HCnq/vs1kwo1J8oRorzLxS3lkV
Cc: openembedded-core@lists.openembedded.org
Subject: Re: systemd: /run directory not created
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
X-List-Received-Date: Thu, 24 Jan 2013 15:08:34 -0000
Content-Type: text/plain; charset=UTF-8

On 24 January 2013 13:03, Radu Moisan <radu.moisan@intel.com> wrote:
> ok, thanks Enrico, this clears the picture for me.
> Well then it looks like Jack's problems is coming from some other place.

No - /run needs to exist for the mount to happen, and there isn't a
/run in the filesystem.  Whatever creates the root filesystem
structure should also create /run I guess.

Ross


