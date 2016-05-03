Return-Path: <mubin10@gmail.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id A73A26FF04
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 May 2016 13:48:30 +0000 (UTC)
Received: by mail-io0-f181.google.com with SMTP id d62so22603987iof.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 May 2016 06:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to;
	bh=qpYJkepK1OvZb2jpgtzy+9sb3v1Ks70CbwvLWwvUJRw=;
	b=k0M9PNXKywDP8K6hiE1kdfKyyTtBnMqEMo1TjIwc37xFcvZuP7SUCPL5O7vYiXU2Ku
	VPpVckRRwlPzEpn9nQO0APABkapi+YZXvj9khJd93fJq19FzAkjGy7dnE+4T8EmSCp8i
	AasnVYi5ilawzi7eI1+4CZVIHGI4yzEQTrrImnuiwMbG4PhOesUf1AFNPi0K2BB3QJUS
	Yya4czt2vW/L3tMlobBcJEjVmh6pQG/AKU4POFb6K3Ohtp+JzvA8JCDBvfm3NamcQ8OB
	Or5b834kFpkE27df4NaytehZK/i6f3wVvMAPQ2NB29MHV0JjvCaE9REwtK8a3ljd5T82
	VIZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
	bh=qpYJkepK1OvZb2jpgtzy+9sb3v1Ks70CbwvLWwvUJRw=;
	b=BdRDdD//oWSRYayT/jg65Y7K1fBCIjfNSG4BJc4VxDx0rJTyRAhQkFlYJE6W9eSZDm
	aTgzP2iHKb/TwzjHiJ+ywbE/+LMRBDyh9aQdOrXh4BBPrPahi0sLfJavJOruweAUoS57
	sVb3RzsH+yE7TyCToeE4/qE+p5sIXO5BupsvjH8ERcYx4W2Je5by0ROachIRZv5+c0t7
	EFdvh6vds7ym34MK3KtWbSoXzrFGHWj4BOudEYwh+RaC+xF6Oh4/dUPZL4j/vh2lvCE3
	ZvYM8NGcnMdWYeVF4LnufYFhRHbbQfWXI99uyI4ZeINqz5a1Vn9QBXDJt6EXKWCQx7EV
	p2IQ==
X-Gm-Message-State: AOPr4FVQ4fsuA+S+ZHL7HaV4ghZPaDNX5etHq+nrjdqb+0DYuPmYBsgyn00rTJjXkqoZTqq7im4QLXXU8FtfCQ==
MIME-Version: 1.0
X-Received: by 10.107.155.1 with SMTP id d1mr3927915ioe.62.1462283310903; Tue,
	03 May 2016 06:48:30 -0700 (PDT)
Received: by 10.79.78.136 with HTTP; Tue, 3 May 2016 06:48:30 -0700 (PDT)
Date: Tue, 3 May 2016 19:18:30 +0530
Message-ID: <CAFUnDm_fLLocYWVPAx3YfSdgiyXPYbd7gpzjT=LXJq=Z1ixaHA@mail.gmail.com>
From: mubin syed <mubin10@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [meta-oe]: Run time dependencies(i.e. Python package/modules) are not mentioned in dstat recipe
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
X-List-Received-Date: Tue, 03 May 2016 13:48:30 -0000
Content-Type: multipart/alternative; boundary=001a1140ad784ecce00531f05d8e

--001a1140ad784ecce00531f05d8e
Content-Type: text/plain; charset=UTF-8

Hi,

I am beginner to the yocto recipes.

I have following observation regarding dstat recipe,

1. dstat utility requires some python modules during it's execution(i.e.
run time dependencies).
2. As per my understanding, yocto recipes should mention their run time
dependencies under RDEPENDS variable.
3. But I observed that, dstat recipe(from meta-oe layer) doesn't have any
package assigned to RDEPENDS variable.


Is there any specific reason to not to mention any run time dependency for
dstat utility?
Please correct me if i am missing something.

Thanks,
Mubin

--001a1140ad784ecce00531f05d8e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>I am beginner to the yocto recipes.=
</div><div><br></div><div>I have following observation regarding dstat reci=
pe,</div><div><br></div><div>1. dstat utility requires some python modules =
during it&#39;s execution(i.e. run time dependencies).<br></div><div>2. As =
per my understanding, yocto recipes should mention their run time dependenc=
ies under RDEPENDS variable.</div><div>3. But I observed that, dstat recipe=
(from meta-oe layer) doesn&#39;t have any package assigned to RDEPENDS vari=
able.</div><div><br></div><div><br></div><div>Is there any specific reason =
to not to mention any run time dependency for dstat utility?</div><div>Plea=
se correct me if i am missing something.<br></div><div><br></div><div>Thank=
s,</div><div>Mubin=C2=A0</div></div>

--001a1140ad784ecce00531f05d8e--
