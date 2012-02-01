Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1RsiyO-0001lG-8V
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Feb 2012 23:48:16 +0100
Received: by qcso7 with SMTP id o7so987474qcs.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Feb 2012 14:40:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=LTywyI6VyDqwBbv3/xAtSYPcOJkkEFEtRYbRpcrlATA=;
	b=pzM2cnukZSHea2Vx+NyR2oofpAoqO1fM8Z3t7/AEXwwe/Pi6V6LAPnjntRve6oKRLX
	3iv9zRg42N9H7DuMtdWImRMtJPdy3XhoyXm1qN7FSNdUnWaO0LjI8eEbLiVdpUfDpOFf
	q+hWGs9H0LyXjE7T5UufaSuOEn/SG21itaxf0=
Received: by 10.224.59.65 with SMTP id k1mr926672qah.54.1328136020288; Wed, 01
	Feb 2012 14:40:20 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.95.207 with HTTP; Wed, 1 Feb 2012 14:40:00 -0800 (PST)
In-Reply-To: <CAP9ODKrepZz_XWj_qBddMP0tX3mNCTdcxCLSBTJXyoPWBC3fcw@mail.gmail.com>
References: <CALbNGRSKUfru5Z-jAJmywTieJUALfLAZgxW_NEhLBK8W5pw1VA@mail.gmail.com>
	<CAP9ODKrepZz_XWj_qBddMP0tX3mNCTdcxCLSBTJXyoPWBC3fcw@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 1 Feb 2012 15:40:00 -0700
X-Google-Sender-Auth: n2Elm33vwm2wYjjBh3omYrjEjbg
Message-ID: <CABcZAN=wTgbz5QHeU+ADEX+p8=gXruygJ2KpQGdvoRLtbAcudg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: accessing variables
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
X-List-Received-Date: Wed, 01 Feb 2012 22:48:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 1, 2012 at 11:16 AM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> On Wed, Feb 1, 2012 at 16:15, Andreas M=C3=BCller <schnitzeltony@googlema=
il.com>
> wrote:
>>
>> another stupid question from my side:
>>
>> do
>>
>> bb.data.getVar('foo', d, 1)
>>
>> and
>>
>> d.getVar('foo', 1)
>>
>> access the same data?
>
>
> It does but the later is supported on recent bitbake versions only.

This is wrong. It's been supported since the first checkin of
data_smart.py in 2005. We just used the other one as a potential
separation of public api and private implementation. We have since
changed our minds and realized that we could just as easily replace
the object with something else which conforms to this API.
--=20
Christopher Larson


