Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1RkP6D-00006b-NS
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jan 2012 00:57:57 +0100
Received: by qcqw6 with SMTP id w6so2241682qcq.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Jan 2012 15:50:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	bh=xSLPbWfqG41WBIZORVg+GPoNtXHSygkRRJ0MY0g2/zk=;
	b=oM164FXiD8k3Gytwtp2WvKV2m4iOXWVlGUQ6pp3FcvfjUrcCTyGmQKBXnuITFiI3Pv
	VzL0WBoIz8sW2n9mkB5gfHpr6fj/OjzYeUztTmIInk51lgDHHcvDdFgbuywyX/+lPtLd
	zvm1vAHuVMerChG75jEg8Tg2308aa1K4j4aXU=
Received: by 10.224.175.2 with SMTP id v2mr21813628qaz.69.1326153029325; Mon,
	09 Jan 2012 15:50:29 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.187.141 with HTTP; Mon, 9 Jan 2012 15:50:08 -0800 (PST)
In-Reply-To: <cover.1325903501.git.tom.zanussi@intel.com>
References: <cover.1325903501.git.tom.zanussi@intel.com>
From: Chris Larson <clarson@kergoth.com>
Date: Mon, 9 Jan 2012 16:50:08 -0700
X-Google-Sender-Auth: k1-PLGbpYQKQn5eYVdRXOJJv9fw
Message-ID: <CABcZAN=3CBOGDCAPHsMFd_JKLdLoK3kzX16pNt3110X32G-gqw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: paul.eggleton@linux.intel.com, philb@gnu.org
Subject: Re: [PATCH 0/5] LICENSE_FLAGS, a replacement for COMMERCIAL_LICENSE, v3
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
X-List-Received-Date: Mon, 09 Jan 2012 23:57:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 6, 2012 at 7:34 PM,  <tom.zanussi@intel.com> wrote:
> Possible values for LICENSE_FLAGS could be:
> - Binary - provides some kind of binary with no source
> - Patent - provides a potential infringing item, that some may not want
> - Commercial - include recipes that may have commercial T&C
> - Commercial_${PN} - commercial licenses specific to ${PN}
> - License_${PN} - include a recipe that has a specific license
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - maybe similar o=
r different than Commercial_${PN}

It's a minor gripe really, but why the capitalization here? Other
similar variables which define lists of words to control behavior
(e.g. MACHINE_FEATURES, DISTRO_FEATURES, IMAGE_FEATURES, and others)
have an all-lowercase convention. I think this should behave
similarly, for consistency.
--=20
Christopher Larson


