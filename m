Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f171.google.com (mail-qk0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id 3D7D271B2B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jan 2017 20:59:24 +0000 (UTC)
Received: by mail-qk0-f171.google.com with SMTP id u25so471489194qki.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Jan 2017 12:59:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=gSv/+8BUq1BqgqAnM+qZJOfbf0+XtfqrE53sf/IQFv4=;
	b=A7F2usRJbuYerOxIy4Z3stqqW8sFiyFEWE+PBtyVQERzsUd0L13rBww79gq89Kd+Um
	5HAAZKlGvCJlK+QWtkuF5TJ7OvveqUjELjWkLMNv68I0B+z03a30sRJOu1egHZcc6P+k
	NfjW235Xx91oADFFx4P2R6lRsy9aCM0uH7r/I0Yf1ua84A+Iao8jeHpL5UcMdckb+0C+
	0qPXC9f9+fZhLjS0wPpYwraJyHz0t0TzjAouXJTfLrzUOn0ja3mqHGC1X+syTVBxz0FA
	3G8JvOpwMQcN4p2IK9D31/U6A8QPbNOXoK6mC8opre+ZsbyhdY3BSXEjXq820CIb2fZx
	QBxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=gSv/+8BUq1BqgqAnM+qZJOfbf0+XtfqrE53sf/IQFv4=;
	b=SCxlzWyhwBLsqpCTlNpEEheNG65D+eTSFPWKj3UckkK26ad8e2Pfg2wxbYZaMMFPi0
	3soqA5xd0Ff3ARXGdoS4xPzcBSwRw9/c4YCBjSzlBhHF1nP1Ft4FJ+ckdW5IhG0v+4Yz
	kpD7aONKEbF70rvLWxeIrE/luZ0txuDI8gGbdfNIYwhib4LSIVEW+Pa05FZWV6Q+oGoz
	MbgNkWWJHlBsP0xSGtsgGpxMp4+oRVNqTubKH9P42ObLPy+r3KnyfEoNIt829xEm6vef
	obT33wVjQhctZ1y80sFZAPFqIjim8XAaCjJJgOYdyUMxT1oKLiozZLXnwEC0RzJ+lhaO
	hJPQ==
X-Gm-Message-State: AIkVDXK4/kALIpoQ6iPE8EblQZH1Zwf/oYz4TNXIpMlnbCS4nXWOPYP1W5d9D+/clqhqUFbpGHBS6CmySJ4kzQXc
X-Received: by 10.55.207.78 with SMTP id e75mr88219988qkj.36.1483736364939;
	Fri, 06 Jan 2017 12:59:24 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Fri, 6 Jan 2017 12:59:04 -0800 (PST)
In-Reply-To: <1483733506.5388.2.camel@intel.com>
References: <1482451659-8896-1-git-send-email-sgw@linux.intel.com>
	<1483733506.5388.2.camel@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 6 Jan 2017 20:59:04 +0000
Message-ID: <CAJTo0La_HmCGRzBEZYdc73B+bLO_AG76JKoRRXn2Q5T=K7NprQ@mail.gmail.com>
To: "Wold, Saul" <saul.wold@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] nfs-utils: remove -f exports from nfsserver
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
X-List-Received-Date: Fri, 06 Jan 2017 20:59:25 -0000
Content-Type: multipart/alternative; boundary=001a1145b7b8f91d030545734af1

--001a1145b7b8f91d030545734af1
Content-Type: text/plain; charset=UTF-8

On 6 January 2017 at 20:11, Wold, Saul <saul.wold@intel.com> wrote:

> Ross: Ping
>

Merged into ross/mut2 a few hours ago :)

Ross

--001a1145b7b8f91d030545734af1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 6 January 2017 at 20:11, Wold, Saul <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:saul.wold@intel.com" target=3D"_blank">saul.wold@intel.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"><div id=3D":1hf" class=3D"a3s a=
XjCH m159756946df6f7da">Ross: Ping<br></div></blockquote></div><br>Merged i=
nto ross/mut2 a few hours ago :)</div><div class=3D"gmail_extra"><br></div>=
<div class=3D"gmail_extra">Ross</div></div>

--001a1145b7b8f91d030545734af1--
