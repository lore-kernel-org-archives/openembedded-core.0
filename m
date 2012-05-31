Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Sa5yG-0004CN-Dv
	for openembedded-core@lists.openembedded.org;
	Thu, 31 May 2012 16:03:24 +0200
Received: by eekd49 with SMTP id d49so370875eek.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2012 06:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=iro4kogkh4reNMLaItFOdnsdRVxxsbv+aP8YA80+HhI=;
	b=ctWJuIIgsrr/JkF50A9zvP6lQTJ+S1tBQiLoe5ExXrN1X2Q1SOymv/i64XRBf8xoA9
	Lm17ZhOTCFLA06wFGl6ihq8UOgjhrH98JmxxSqdGR2Kq/d5qGzR/z3nrL/oAm8U93u8C
	eCU2LDtxjK3S8iZY/iDslimiNJRan8s4aFcin4ZW7DuCrG94YtLuhl2NDTt7i/+LAr+A
	KxW2LCt3IYxC/OIrvl6x+lihJ2mPZfyLSdGL2am9hO0Uom0srdjf7X1icwWzlPcBe1zj
	l+NRADc9yrGr2eu62jaJwIN9NKlTkJpalRXT3vhn5k6wTGQD5tTZOIrByYzg4vBB4LlG
	jpHA==
Received: by 10.14.119.197 with SMTP id n45mr8285992eeh.180.1338472384538;
	Thu, 31 May 2012 06:53:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.188.11 with HTTP; Thu, 31 May 2012 06:52:34 -0700 (PDT)
In-Reply-To: <CAOHjBZvGY9BWkyS+9V4OtGFcQpCC2SdzKwG9pQ0wq_oeqU=uTw@mail.gmail.com>
References: <CAOHjBZsptjefvQA3od1HV4s_fVcoHidWs5qUm-2A5+Fr9ZrRLg@mail.gmail.com>
	<CAMKF1spunqV3__K7_jEt5oQwg=J0v+TwZSUtGOv=DeipCPkzSA@mail.gmail.com>
	<CAOHjBZv9jC9pVwxS9CCjvY0wFo8_9sOaFeUQwMxPEuF8EJDuiA@mail.gmail.com>
	<CAOHjBZvGY9BWkyS+9V4OtGFcQpCC2SdzKwG9pQ0wq_oeqU=uTw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 31 May 2012 06:52:34 -0700
Message-ID: <CAMKF1so8aA=s7wfo9k9wGNSwyuGYXmd5Ec9x=5Bp0YJbaiJoFA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: target rpm build failure
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
X-List-Received-Date: Thu, 31 May 2012 14:03:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, May 31, 2012 at 5:35 AM, Giuseppe Condorelli
<giuseppe.condorelli@gmail.com> wrote:
> Is there=C2=A0some=C2=A0difference for uclibc? Please let me know.

opkg works well with uclibc based systems. Those functions are not
implemented in uclibc I am sure it can be fixed
by linking in other libs or may be creating one. However if you are
not bound to rpm then I would suggest to use opkg

in your local.conf set it

PACKAGE_CLASSES =3D "package_ipk"

-Khem


