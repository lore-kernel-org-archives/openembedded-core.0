Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RLlWx-0005iu-7T
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Nov 2011 01:51:43 +0100
Received: by bkbzv3 with SMTP id zv3so691011bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Nov 2011 17:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=nQiVEPt/QZAgw2ztJtP0jGpFij4cIiHBXFORp55Fhuc=;
	b=fnC6uC6yWXnEChQQeN9BgFnV/Dqc7w8jUj+Z1baQgK8YnieUipOcc++A0LAJwjhjD+
	/GSxi2wOyRXeSNSgeKniyvTvEt9mzsGpN0mjrnnFuthtvX583BRP+KzDN0bSkalekA4d
	ble9pE7ugXOz0TYkPEpK9do24JVeoS8J5TV8M=
MIME-Version: 1.0
Received: by 10.204.15.209 with SMTP id l17mr5975870bka.39.1320281132535; Wed,
	02 Nov 2011 17:45:32 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.48.208 with HTTP; Wed, 2 Nov 2011 17:45:32 -0700 (PDT)
In-Reply-To: <4EB1D0DA.10108@intel.com>
References: <cover.1320183757.git.sgw@linux.intel.com>
	<5f42fbce6e383b6330efde454da2cfe0a38df5cf.1320183757.git.sgw@linux.intel.com>
	<CAP9ODKo+BrVout44UaDOLfk5mEz+dFA4qGvx3L-B6ZP0Bjakbg@mail.gmail.com>
	<4EB1D0DA.10108@intel.com>
Date: Wed, 2 Nov 2011 22:45:32 -0200
X-Google-Sender-Auth: hJIq92h8Me7xnHJ7CsszvlQOlcs
Message-ID: <CAP9ODKpgNttUi4o_pW3jjGBg2=3VoN=DLDt8RusKjnB51+hEuw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Saul Wold <saul.wold@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [Pull v2 3/4] connman: create xuser
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
X-List-Received-Date: Thu, 03 Nov 2011 00:51:43 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 2, 2011 at 21:23, Saul Wold <saul.wold@intel.com> wrote:
> On 11/02/2011 11:54 AM, Otavio Salvador wrote:
>>
>> On Tue, Nov 1, 2011 at 19:44, Saul Wold<sgw@linux.intel.com> =A0wrote:
>>>
>>> We create xuser here as a backup incase that xerver-nodm-init
>>> is not on the system.
>>
>> This is wrong. If xserver-nodm-init (btw, there's a typo on the commit
>> message) is not in the image user is suppose to know what he/she is
>> doing so we shouldn't add users not required to make their life
>> easier.
...
> The situation is that when xserver-nodm-init is not installed or this is =
not
> a ROOTLESS_X, dbus still requires the xuser be available for connmand to =
run
> correctly.

Something is wrong here; or it is being handled on the wrong package
or the design is wrong.

Shouldn't it be in base-passwd then?

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


