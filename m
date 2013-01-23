Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Txxzx-0005O8-G2
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Jan 2013 11:56:18 +0100
Received: from mail-gh0-f198.google.com ([209.85.160.198])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 23 Jan 2013 02:40:32 -0800
Received: by mail-gh0-f198.google.com with SMTP id r11so4476955ghr.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jan 2013 02:40:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=rL0LGJ5oBj99REfqBOxqO2GBJSPUOMQFgxEADQgXPkw=;
	b=LauUHq3PpukLB5ULEl/OBOrI4UygZtPIW3dVw0rKN9md7PLrmRbledMwdrpB6MVa6L
	THBONj3wdKuYxbkpltgiMtNa4YnVIZQ96FGqT5wVN+wO2iiwS/c0gs6cYQaxprT1Eq2M
	4zVnRSUXKb8obGUiy4d5d44p7gQ3loQIxirYPufUJLX1RUpx8uv8IAVthKjXuxg++V7C
	TXra4aBN0S2BO+JKiURiiMfaXLj+4oKq1TiNT5eP0h+bvFhly4416CXvfgLeBugspMwu
	pafJRs9vzk4RFbXGAOyOucqb9lIxPo+LSe/fGYrhwbhIjAslfU7ZYp21OA9aDi3E0m+u
	UHfw==
X-Received: by 10.52.66.71 with SMTP id d7mr595185vdt.121.1358937631788;
	Wed, 23 Jan 2013 02:40:31 -0800 (PST)
X-Received: by 10.52.66.71 with SMTP id d7mr595178vdt.121.1358937631675; Wed,
	23 Jan 2013 02:40:31 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.152.232 with HTTP; Wed, 23 Jan 2013 02:40:11 -0800 (PST)
In-Reply-To: <CALbNGRTpOzUnNrOMH9AsTnG320z88iT1pmz2qrj0GBkyrkgLYw@mail.gmail.com>
References: <CALbNGRTpOzUnNrOMH9AsTnG320z88iT1pmz2qrj0GBkyrkgLYw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 23 Jan 2013 10:40:11 +0000
Message-ID: <CAJTo0LayN8m-GCitEb4GU5DSwGzcNfhf0nhQinvY=bWKNiM-LA@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
X-Gm-Message-State: ALoCoQmVBYA7A3/ANzFs2nCEnxMBhKs0+XHnAkQDSxsbD8KvOgk4T8Ckm/pd6Fgb6BxieQrR7JMruh/VihOKoBWhcn8Xuj12aFXzLUhIevVd+oWJFWcQbE4m/8pjmy9UoNt7FHRGWs9dF6WNPHgWvP+aI9rjO+LqwUbIBBk4rP4C85+myZTrcLTa+RFc4dVnmM9YxlF0eo83
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: future of meta-systemd
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 23 Jan 2013 10:56:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 23 January 2013 00:46, Andreas M=C3=BCller <schnitzeltony@googlemail.com=
> wrote:
> Major difference is that we now get a distro feature for init system
> (for systemd part kind of D=C3=A9j=C3=A0-vu for me..). As I see it, we sh=
ould
> now merge all appends back into the layers, align some configurations
> depending on systemd and remove meta-systemd.
>
> If this is correct: Is anybody out there willing to or already working on=
 this?
> If not: What is the suggested layout?

I do intend on merging all of the changes that should land in oe-core.
 Help is much appreciated once systemd.bbclass lands.

Ross


