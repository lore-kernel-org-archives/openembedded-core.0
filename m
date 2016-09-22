Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id F3403600BC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2016 15:12:11 +0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id q92so88949201ioi.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2016 08:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=rEYihJEu/e6zdX5jkhSuurrDxa54YCdCYkZJ8SLRQ6A=;
	b=w/imaNjbXPbIPhABoo69iS83AMfhmufmZkPWI0G1iLEllRiNDcm40TWuf9N511Hhy4
	qDzh/Rd5vrOHC6ulYhSCZkPiLyEmvwKDD5Cnd7WL+rHkQJOZuYhAKChToBnI7Enz74bw
	rURJ5hn6kjY94eFwNP/9Jb/jQnMLEYGHsgGM8KOGzeU5UuMYHqg0fZgh2SBvzlQF7opc
	o4My8aXC7SjQoV4nhuUCMFNlkxAnA0Z0oT3OYcOvaIU99S6tfss85iMpa7Zleod9Aka0
	VPRRqvfIGrTRbTjI72SY8XeLUvv9BjES/LCI3178qyGKACvu09yJ0jazo04TlojXadVV
	Avzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=rEYihJEu/e6zdX5jkhSuurrDxa54YCdCYkZJ8SLRQ6A=;
	b=IXSZkYfNSuEzZhqWDS/aacI4wFDpD/SJcQZ8frt8ABjJg5c4sIXJMRwXZZD3ojpea7
	3096RjbdkBrtsbjCzSkr7XXk7uFIbbJhh8kllcuhU0GmEIetok9zCg+MPMiaeemXVwi3
	cQFptgGNt+buTTtQUd2UUkM824NwzRyPORVmnG0Oj6BHnsciyrEUzLlygFt1kBjsQ5lL
	ViLrywdybpOmmQML0wiByaKHnwFs9yWIlXck9INCPAtZHgRqyRQkUK7fLFzh1YZuDeAF
	YKBZhUbURaWUiU5gDOwj04KKCzhphb8HbresdqumXgYknTUQit7yd3l3wou//LYngUMM
	QLjA==
X-Gm-Message-State: AA6/9RnHqRLOq8ANRPHOa9AGfmroxXSEatvcAK6kRY996yL2fCrEhnNo1uTKqS9sPJugvHOGeNU9mW9VaDl3Vy1t
X-Received: by 10.107.53.206 with SMTP id k75mr3174784ioo.195.1474557133099;
	Thu, 22 Sep 2016 08:12:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.155.66 with HTTP; Thu, 22 Sep 2016 08:11:52 -0700 (PDT)
In-Reply-To: <C43D7C6FFC265C429F44FEB1C68F1B25633E16F5@G08CNEXMBPEKD03.g08.fujitsu.local>
References: <CAJTo0LZaZj0CdXQAivEqyBQusc4HT54u6_0x943G58XQy-6wiA@mail.gmail.com>
	<1472181104-1867-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
	<C43D7C6FFC265C429F44FEB1C68F1B25633E16F5@G08CNEXMBPEKD03.g08.fujitsu.local>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 22 Sep 2016 16:11:52 +0100
Message-ID: <CAJTo0Lb=Tpprky6hXSr1UjdUWSK1wQZQeQ6y1srzZXo6fsjxtQ@mail.gmail.com>
To: "Wang, Xin" <wangxin2015.fnst@cn.fujitsu.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4] bind: 9.10.3-P3 -> 9.11.0b2
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
X-List-Received-Date: Thu, 22 Sep 2016 15:12:12 -0000
Content-Type: multipart/alternative; boundary=001a114495041ee907053d1a1685

--001a114495041ee907053d1a1685
Content-Type: text/plain; charset=UTF-8

On 22 September 2016 at 02:36, Wang, Xin <wangxin2015.fnst@cn.fujitsu.com>
wrote:

> ping
>

Sorry, this missed the M3 cutoff for features so will have to wait for
master to open again (after 2.3 release).

Ross

--001a114495041ee907053d1a1685
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 22 September 2016 at 02:36, Wang, Xin <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:wangxin2015.fnst@cn.fujitsu.com" target=3D"_blank">wangxin2015.fnst@c=
n.fujitsu.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div =
id=3D":2dr" class=3D"a3s aXjCH m1574f8a1f4f2d034">ping<br>
<div></div></div></blockquote></div><br>Sorry, this missed the M3 cutoff fo=
r features so will have to wait for master to open again (after 2.3 release=
).</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ros=
s</div></div>

--001a114495041ee907053d1a1685--
