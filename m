Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f179.google.com (mail-qk0-f179.google.com
	[209.85.220.179])
	by mail.openembedded.org (Postfix) with ESMTP id 8678376AC5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Sep 2015 16:46:15 +0000 (UTC)
Received: by qkap81 with SMTP id p81so32118820qka.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Sep 2015 09:46:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=FVmamTp31znplgJOw0hNaUBqMa/JOc+cdI1eTYNBSn4=;
	b=B+PAxwr8M12A/BOtasQJT5VgH2XfvKolQQv9tmP/IPEjBnniZ7OvRzLS7ccWdDLcIs
	V2aVQq6RsEEumfFz/+hxRJvvR2KGLdh1rqqCEbshBu13VK0Sc3jiIPZe2EV/jPhGhY7h
	IdPCKcL1xLTb4+0tfubg3p8sEULyvpkPZefRy3vwyVVdi6gRbFqWndkUqa9ik/wLqRh5
	qA2O/FgW+Rq8gWgw4iDPMNHYw7k0I2QCN4Rxn4k+8wXGfSwGJWMSqA3peP+9HVHYyMPe
	UfNJSqnmU9k/eGAsLdEtnjcfB59SemuD+x48WexlnUJKe0F6+gFNMeiEx5jLY1mAIRFb
	atWw==
X-Gm-Message-State: ALoCoQnYdRpbcJ3HratXFBqo7OwvF/Om3iNQnuY1SYkK+tEA9o9g29j8LFYXxsCskxehHVmueqd/
X-Received: by 10.55.221.199 with SMTP id u68mr847796qku.83.1443113176249;
	Thu, 24 Sep 2015 09:46:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.86 with HTTP; Thu, 24 Sep 2015 09:45:56 -0700 (PDT)
In-Reply-To: <1443092411-3822-1-git-send-email-george.l.musat@intel.com>
References: <1443092411-3822-1-git-send-email-george.l.musat@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 24 Sep 2015 17:45:56 +0100
Message-ID: <CAJTo0LbaOG1cScfJzfnoOj4BAYF1KCg+omhtACCtDpc6YSfa6Q@mail.gmail.com>
To: Lucian Musat <george.l.musat@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] oeqa/runexported: Fix a problem with ssh_target_log existing in folder.
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
X-List-Received-Date: Thu, 24 Sep 2015 16:46:17 -0000
Content-Type: multipart/alternative; boundary=001a114997583dee23052080f821

--001a114997583dee23052080f821
Content-Type: text/plain; charset=UTF-8

On 24 September 2015 at 12:00, Lucian Musat <george.l.musat@intel.com>
wrote:

>          if os.path.islink(sshloglink):
>              os.unlink(sshloglink)
> +        elif os.path.isfile(sshloglink):
> +                os.remove(sshloglink)
>

So if sshloglink is a link or a file, delete it.   How is this different
from just deleting the file if it exists?

Ross

--001a114997583dee23052080f821
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 24 September 2015 at 12:00, Lucian Musat <span dir=3D"ltr">&lt;<a href=
=3D"mailto:george.l.musat@intel.com" target=3D"_blank">george.l.musat@intel=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1r=
d" class=3D"a3s" style=3D"overflow:hidden">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0if os.path.islink(sshloglink):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0os.unlink(sshloglink)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 elif os.path.isfile(sshloglink):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.remove(sshlogli=
nk)</div></blockquote></div><br>So if sshloglink is a link or a file, delet=
e it. =C2=A0 How is this different from just deleting the file if it exists=
?</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross=
</div></div>

--001a114997583dee23052080f821--
