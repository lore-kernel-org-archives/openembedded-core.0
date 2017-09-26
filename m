Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id 74D7D77E55
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Sep 2017 17:19:21 +0000 (UTC)
Received: by mail-io0-f169.google.com with SMTP id d16so13436361ioj.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Sep 2017 10:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Wot0oDltaMMNvBxvCWv80YGIYll6gegcUPsyd2xfnGo=;
	b=oe9zvOF0LA+63xAiaKxAymEpqcaW2UK0LAREnNguGTRWNZ1eZQZWD2v2r2vrM5KjpU
	tZLTeO4Vliz58yx9qfjCD6cK8GI7F2gfLTmHARkpPwVrQVtk8GW+X+tEeN6+nt2I/CQj
	+oLJqkZkK+flLSruW/IMi87Ht6j0/er5kPA3v67rF2YPh05wGHQvzMTD82Xeci5VbgDS
	4oOaW/WewTQnl0lpILp7AmpBCW0642EMSXaVYgfnOXVTMkX7Yf2SmYERT9W82MxugWWQ
	fEQowhbLI8s6HyXtOKEA1jhcSON9gfHiWynsIsx4xg/zuPbXhewfxQbZ1oAmlVbXnYhY
	kWDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Wot0oDltaMMNvBxvCWv80YGIYll6gegcUPsyd2xfnGo=;
	b=QXb3MnL5BzrF3ExbCK4/EMnDaQzVZ+2jTaLvDPT9+iyxnKvakoJtUH13YFIQ8cWhkX
	d1SR4t682TFaf5PEWXSv6W8lJxs6L8WkCkO3hWkXdO7Lb7J4el2TmBw4pyEIhmUZgXZr
	a9a+u8kOkoOHR9JjMf6p8BBhE1iaxKpU0FEgzSwyU3uM31xu/fqMEGeCI6ImoPJIFTpQ
	VWs4lMLbp+fPbgQwvw2Cp+Uzg2mAD0geKVa1FsMoIfaZ98Sa5S6vJuuALDQ1RFf45w3I
	DB/Q+r7p966udg4nvQaetTqkvSTW/PAgbE9/vl62A9jizwHNu9CfX+isnmoixMyxnYmC
	NK/g==
X-Gm-Message-State: AHPjjUj6apfXGDr8xFCx/zEa2kvMSWkE4EVjRk8uiiZ5HkQdKCa0yXdL
	+QO7g2dfOx/qVp28mznjYlVCc3+4305IcYMQPx2dOw==
X-Google-Smtp-Source: AOwi7QA+2de9e+eVrXnmpJfqQicW18621dfOTtpnjHn1TL2FigCZbGNTxhL7vn75WZafbOXOlc+vMKhHJntb59u48Mg=
X-Received: by 10.107.32.70 with SMTP id g67mr16024818iog.77.1506446362593;
	Tue, 26 Sep 2017 10:19:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.19.68 with HTTP; Tue, 26 Sep 2017 10:19:01 -0700 (PDT)
In-Reply-To: <20170926171708.19010-1-andreas.kling@gmail.com>
References: <20170925085929.16112-1-andreas.kling@gmail.com>
	<20170926171708.19010-1-andreas.kling@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 26 Sep 2017 18:19:01 +0100
Message-ID: <CAJTo0LZCfEu_zP=RCyTQDuOEJXsS-znyBce4ygvos2LNieHaWg@mail.gmail.com>
To: Andy Kling <andreas.kling@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] systemd: move pam files to own package
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
X-List-Received-Date: Tue, 26 Sep 2017 17:19:21 -0000
Content-Type: multipart/alternative; boundary="001a1140ae2c50ec38055a1ae04b"

--001a1140ae2c50ec38055a1ae04b
Content-Type: text/plain; charset="UTF-8"

On 26 September 2017 at 18:17, <andreas.kling@gmail.com> wrote:

> From: Andy Kling <andreas.kling@peiker-cee.de>
>
>   move pam related files to already existing systemd-pam package.
>   add runtime dependencies to required pam plugins.
>
>   This ensures pam plugins required by /etc/pam.d/systemd-user
>   to open a user session are installed.
>
>   systemd[1]: Starting User Manager for UID 994...
>   systemd[6493]: PAM unable to dlopen(/lib/security/pam_keyinit.so)
>

Considering systemd-pam appears to be unused currently, and if PAM is
enabled it is fairly fundamental, why not just add the missing dependencies
and not move files around?

Ross

--001a1140ae2c50ec38055a1ae04b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 26 September 2017 at 18:17,  <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:andreas.kling@gmail.com" target=3D"_blank">andreas.kling@gmai=
l.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D"gma=
il_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex"><span class=3D"">From: Andy Kling =
&lt;<a href=3D"mailto:andreas.kling@peiker-cee.de">andreas.kling@peiker-cee=
.de</a>&gt;<br>
<br>
=C2=A0 move pam related files to already existing systemd-pam package.<br>
</span>=C2=A0 add runtime dependencies to required pam plugins.<br>
<br>
=C2=A0 This ensures pam plugins required by /etc/pam.d/systemd-user<br>
=C2=A0 to open a user session are installed.<br>
<br>
=C2=A0 systemd[1]: Starting User Manager for UID 994...<br>
=C2=A0 systemd[6493]: PAM unable to dlopen(/lib/security/pam_<wbr>keyinit.s=
o)<br></blockquote><div><br></div><div>Considering systemd-pam appears to b=
e unused currently, and if PAM is enabled it is fairly fundamental, why not=
 just add the missing dependencies and not move files around?</div><div><br=
></div><div>Ross=C2=A0</div></div></div></div>

--001a1140ae2c50ec38055a1ae04b--
