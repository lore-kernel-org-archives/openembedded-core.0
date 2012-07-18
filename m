Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SrVpr-00073y-IS
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jul 2012 17:06:43 +0200
Received: by lbol5 with SMTP id l5so2154960lbo.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jul 2012 07:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=cL+Ik/KoXnXUL4wXXQMPkmkur4wfYtt3imcmO3NYMUA=;
	b=YDRfApPwTD+7WZ14eSntd3s/AQkduemWIW+q8aWp1Vphy04y5svnK8RUfIUC860HDO
	Pozk/7jlbI/ar0eYxw3/e42CqiT7Q4ozsfybv22lnHcFT+kqJ3gHMAbcKkJE793RWbSx
	Y2q3zQ7CEa5WmJWRpZUCX7tcPZcrqK3tUCk0NHZx7jK58XKi9zzJmXTk8m39mCyKrqNB
	kuR4+czTcIT9yC0+yxniZS3o9JVforyMZ1yesR83a9GbZ4B6owKilx4ZDj/xowDj4X7a
	jJMhx4PRwQtHr8lLAtwhF9T5d4lJTGpjdy0x7zxaraEWLcJ1vE67/oQESUse1/Uuxyup
	pImQ==
Received: by 10.112.85.225 with SMTP id k1mr1972245lbz.38.1342623322720; Wed,
	18 Jul 2012 07:55:22 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.114.64.180 with HTTP; Wed, 18 Jul 2012 07:55:02 -0700 (PDT)
In-Reply-To: <CALbNGRSSusDKWfdEMVH5hY1fA2gpxhLrJ2dTE7SEHx1o7QU+3Q@mail.gmail.com>
References: <CALbNGRSSusDKWfdEMVH5hY1fA2gpxhLrJ2dTE7SEHx1o7QU+3Q@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 18 Jul 2012 07:55:02 -0700
X-Google-Sender-Auth: rX7YQsUjDav-YnZqcwOwaFDKljk
Message-ID: <CABcZANm5a+VFPwDjaPZFmy4vQtQX=_os+SOycxfuAnqaEzbfnA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: build crashes immediately at build clean sstate/tmp dir
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
X-List-Received-Date: Wed, 18 Jul 2012 15:06:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 18, 2012 at 7:53 AM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> I just updated all repos / deleted all tmp / sstate and get
>
> ERROR: Only one copy of bitbake should be run against a build directory

ps -ef|grep bitbake
--=20
Christopher Larson


