Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f45.google.com (mail-oa0-f45.google.com
	[209.85.219.45])
	by mail.openembedded.org (Postfix) with ESMTP id 3BA426AFF3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jul 2013 13:21:28 +0000 (UTC)
Received: by mail-oa0-f45.google.com with SMTP id j1so1900572oag.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Jul 2013 06:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=6hdsQxOUMQmT4S3vUV25Ao7TXuq/Pn2B5JkKiLV1isc=;
	b=SzmTbNbO3IUFVmBrvypX1rv1KIcSpo+GV462ZE2NwXF/8HaBsnKqh+tnar78IzPsTC
	VoXNCLQEnBjBgBCxS9b9ealSMJgdpUPMteKiWakuFNcdY7YWfkScfNs4sYEIbmikVnT0
	0H7ro/aV21QqlZHRu9jBUYptZSZYu91UYEyvqysz3FpT3lbmP+H/KjldMGfzw+AaVMGD
	KMquBIcyX+De9C189Tna1PrhBzfBi07CR082CyFd7NyL6QWRUzOlQfRx4fcFk48S5eq/
	nIAau2RoPXyUwVxE58TFVaT34O0wsHof5PQc6JedJoQfdaly7n2Uml7NZxSSVLtvrBGU
	BWFg==
MIME-Version: 1.0
X-Received: by 10.60.55.196 with SMTP id u4mr6009548oep.57.1372944088975; Thu,
	04 Jul 2013 06:21:28 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.98.133 with HTTP; Thu, 4 Jul 2013 06:21:28 -0700 (PDT)
In-Reply-To: <c9b8490c65d03e9bc3f603d2a3a20ea680c089aa.1372890071.git.sgw@linux.intel.com>
References: <cover.1372890071.git.sgw@linux.intel.com>
	<c9b8490c65d03e9bc3f603d2a3a20ea680c089aa.1372890071.git.sgw@linux.intel.com>
Date: Thu, 4 Jul 2013 10:21:28 -0300
X-Google-Sender-Auth: aNSPDo2Hipp3K6gGdt4uk-uzN64
Message-ID: <CAP9ODKoDZBGsS2LzX==aa_2V-FVzhE6X91xkcEec8+VDy0Tu9A@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/8] util-linux: disable runuser by default since it depends on PAM
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
X-List-Received-Date: Thu, 04 Jul 2013 13:21:28 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jul 3, 2013 at 7:26 PM, Saul Wold <sgw@linux.intel.com> wrote:
> util-linux's configure checks for pam_misc.h and if it finds it will
> enable runuser, there was a case where it was found via shared state
> and then got rebuilt. This makes the build more deterministic.
>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>

Please make this as a PACKAGECONFIG and add it if pam feature is enabled.

--
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

