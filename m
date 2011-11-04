Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lohmer.p@googlemail.com>) id 1RMG5y-0006Jf-4w
	for openembedded-core@lists.openembedded.org;
	Fri, 04 Nov 2011 10:29:54 +0100
Received: by faas16 with SMTP id s16so2664515faa.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Nov 2011 02:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=I9HXEw4Glcr9WHwvhzM/vLY7x9XKx8rWkf8wQYWmYvw=;
	b=qg4t1uBzqGX6Jeq1iYGK1tYrX1IPwmR/DsQqam31S5PkH6A+Wtm+iDNcJlUyKr/BjA
	Ovl8wcRHPMvUEhks6T+R0CeliYhTSVJY6wTscvwo8NMQKIs3bmxUYt4VL/B05u/NIQ8o
	E5huHmhBANzNDHe4p+Sah4hC6yAdIohzvgxbs=
MIME-Version: 1.0
Received: by 10.223.58.134 with SMTP id g6mr9024111fah.0.1320398625008; Fri,
	04 Nov 2011 02:23:45 -0700 (PDT)
Received: by 10.223.15.89 with HTTP; Fri, 4 Nov 2011 02:23:44 -0700 (PDT)
In-Reply-To: <CAE1-YAFQW1LXHfND8on-KBp-4fid32EAh5N12DD_hdmhc_54Qw@mail.gmail.com>
References: <CAE1-YAFQW1LXHfND8on-KBp-4fid32EAh5N12DD_hdmhc_54Qw@mail.gmail.com>
Date: Fri, 4 Nov 2011 10:23:44 +0100
Message-ID: <CAE1-YAGuD3+ccvJ0kFgEFuJCpew_T0VX85YH3sMuNYdyu729CA@mail.gmail.com>
From: Peter Lohmer <lohmer.p@googlemail.com>
To: openembedded-core@lists.openembedded.org
Subject: Error building any image
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
X-List-Received-Date: Fri, 04 Nov 2011 09:29:54 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi all,
after last oecore update building fails with the following error message:

peter@p-lohmer-linux:~/oe-core$ bitbake -k xfce-nm-image
Loading cache: 100%
|##########################################################################=
################################|
ETA:=A0 00:00:00
Loaded 1826 entries from dependency cache.
Parsing recipes: 100%
|##########################################################################=
##############################|
Time: 00:00:00
Parsing of 1418 .bb files complete (1414 cached, 4 parsed). 1825
targets, 72 skipped, 0 masked, 0 errors.
ERROR: No recipes available for:
=A0 /home/peter/oe-core/sources/meta-smartphone/meta-openmoko/recipes-multi=
media/mplayer/mplayer2_git.bbappend
ERROR: Command execution failed: Exited with 1

I believe it's caused by meta-smartphone, does anyone face the same problem=
 ?

Regards Peter


