Received: from mail-vc0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TdkJb-0005ts-Ni
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Nov 2012 17:16:47 +0100
Received: by mail-vc0-f175.google.com with SMTP id m8so9781131vcd.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Nov 2012 08:02:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=HFHaSM57d8P5fFGMNwq3Jf7nmtbPOukEepoyms/hfio=;
	b=HrsqkdhIdT8WiVxan3FO5hTzzNdCoV5/t3iIj7uKkOU9ks0jy/J4U1SGgUiTMhSe5V
	dw98gc05vU7Owu2aLJ5EXPHaVEqi4PBmcVyANTzKn/SkCT8kZvZrPYBhPAJji39yY2We
	3xQDnV3DOfG/Lo4SCEpJg/OF1fnmIJpLt9RTj/awN79SY3SKjmzaYt/fMYF3taNbJpQH
	Nbu/a64uVTIzLKpmpsgl1dzsW34kV7lr/KkGMHrsRmN71M/K2zdtAsBWsFpOvAoLgqmG
	83FCPBC3CK3afxsSsk/6b6/aII63WsMxqOK+MlIyWcfTzb4kjP3vE4y8epq5qwSGml4N
	A3kw==
MIME-Version: 1.0
Received: by 10.52.27.2 with SMTP id p2mr25183056vdg.85.1354118552805; Wed, 28
	Nov 2012 08:02:32 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.220.116.17 with HTTP; Wed, 28 Nov 2012 08:02:32 -0800 (PST)
In-Reply-To: <CAJTo0LZXgDtv_EsxnCvLv5nyHpf5FBtFYRYtXyCj+7D=uKpWDA@mail.gmail.com>
References: <1354116528-21598-1-git-send-email-ross.burton@intel.com>
	<CAP9ODKo4+FnG=c1m88HeG-MxbzQD-+MyLo85G47Qh_uNcxKJEw@mail.gmail.com>
	<CAJTo0LZXgDtv_EsxnCvLv5nyHpf5FBtFYRYtXyCj+7D=uKpWDA@mail.gmail.com>
Date: Wed, 28 Nov 2012 14:02:32 -0200
X-Google-Sender-Auth: Eo3MEYMKWLWuaACbXAhSgazvngs
Message-ID: <CAP9ODKqBNJ7QpJq7M_-0=G=rq3EZiCeBeWpBHGiGju53o9a2ZA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] xserver-xorg: restore packaging for the DRI/DRI2/DBE extensions
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
X-List-Received-Date: Wed, 28 Nov 2012 16:16:47 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Nov 28, 2012 at 1:56 PM, Burton, Ross <ross.burton@intel.com> wrote:
> On 28 November 2012 15:51, Otavio Salvador <otavio@ossystems.com.br> wrote:
>> On Wed, Nov 28, 2012 at 1:28 PM, Ross Burton <ross.burton@intel.com> wrote:
>>> Even though the current xserver in oe-core (1.13) doesn't ship these as
>>> standalone extensions, older X servers required by binary drives
>>> (e.g. meta-intel's 1.9) still install them separately.  As the packages didn't
>>> exist in xserver-xorg.inc the extensions were not packaged, and X didn't work.
>>>
>>> Revolve this by restoring the package definitions, and moving the upgrade path
>>> dependencies to xserver-xorg_1.13.bb.
>>>
>>> Signed-off-by: Ross Burton <ross.burton@intel.com>
>>
>> Wouldn't be better for this packaging be done in meta-intel in this case?
>>
>> My concern here is to leave unused meta-data; I am not a big fan of it at first.
>
> That's a valid concern, and I almost did that.  The fact that binary
> drivers locked to specific version of X are so common swayed me into
> being nice to them, so they don't need to replicate all of the
> packaging themselves.

Well but in this case we would be better to have 1.9 in oe-core, in this case.

I understand your point and I partially agree with it (I suffer of
same pain) but it doesn't seem right to keep this code.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


