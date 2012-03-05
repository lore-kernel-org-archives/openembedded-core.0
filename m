Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1S4h2Y-0000Sq-99
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Mar 2012 00:10:02 +0100
Received: by lagw12 with SMTP id w12so5478174lag.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Mar 2012 15:01:27 -0800 (PST)
Received-SPF: pass (google.com: domain of raj.khem@gmail.com designates
	10.152.148.230 as permitted sender) client-ip=10.152.148.230; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of raj.khem@gmail.com
	designates 10.152.148.230 as permitted sender)
	smtp.mail=raj.khem@gmail.com;
	dkim=pass header.i=raj.khem@gmail.com
Received: from mr.google.com ([10.152.148.230])
	by 10.152.148.230 with SMTP id tv6mr19993572lab.12.1330988487342
	(num_hops = 1); Mon, 05 Mar 2012 15:01:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=HWerNVUpY179YvRK6LyDsOS06RcrK/9aDYKi9newst0=;
	b=krlEKy35QQiNrpIEgEOvCErUlWMcVCJydc4q7fSjEydOOOOf1jFLYHMhGtOlPWw0bZ
	i5hn/tOF2Uda+6dyzvJ6NDym+bkvS3h2+2Knsrk+v1CEyKyhf14dOPjTPzAxp2wyte4a
	V9VkgaXwFQDrm4qhHzW5c+rRndJLYADoHZiY4lKhtVddzI+YwoCCYxizrESfIvbSk/w8
	rE0Dl8CHOvTlLk5Vtg02e/BdIj37HIjL98HL4kX7s8FuVySo2g3KaG2wGu6VBx9qjzD5
	WlDoZ/NK4x6EoHly2xZz08hHC6snCYW3DUzoLsv2qPM2DvHCYKHTIJwX1POxMWHIb93+
	p/sQ==
Received: by 10.152.148.230 with SMTP id tv6mr16375697lab.12.1330988487261;
	Mon, 05 Mar 2012 15:01:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.27.109 with HTTP; Mon, 5 Mar 2012 15:00:57 -0800 (PST)
In-Reply-To: <4F553FD6.1060604@linux.intel.com>
References: <1330928512-12937-1-git-send-email-raj.khem@gmail.com>
	<4F553FD6.1060604@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 5 Mar 2012 15:00:57 -0800
Message-ID: <CAMKF1srXj4TNNZDvhFsTW1apPKFo0NbhMDBdw8nnacYJ0SZxGA@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc: Upgrade to 4.6.3 release
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
X-List-Received-Date: Mon, 05 Mar 2012 23:10:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 5, 2012 at 2:36 PM, Saul Wold <sgw@linux.intel.com> wrote:
> Khem,
>
> We are moving into stabilization phase with oe-core with the pending 2012=
-01
> version. =C2=A0I am going to pull this locally to MUT and start testing i=
t, if I
> get good results, we will get it into master now, but if we see issues, i=
t
> will likely get held for master-next and most 2012-01.

yes. let me know if there are any issues.


