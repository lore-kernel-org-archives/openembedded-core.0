Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id BBF9D718E4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jan 2015 15:58:58 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 27 Jan 2015 07:58:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,475,1418112000"; d="scan'208";a="668424146"
Received: from krogon-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.16.44])
	by fmsmga002.fm.intel.com with ESMTP; 27 Jan 2015 07:58:57 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Walter Giroir <walt@giroir.com>
Date: Tue, 27 Jan 2015 15:58:57 +0000
Message-ID: <4091594.HCBa4JHXK6@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.3 (Linux/3.17.8-200.fc20.x86_64; KDE/4.14.3; x86_64; ; )
In-Reply-To: <D2AF7345-D886-4C20-83F5-1782022A400C@giroir.com>
References: <loom.20150124T182655-678@post.gmane.org>
	<2979985.IVZ0R9uNM5@peggleto-mobl5.ger.corp.intel.com>
	<D2AF7345-D886-4C20-83F5-1782022A400C@giroir.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: create_image() fails with cannot concatenate 'str' and 'NoneType'error
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
X-List-Received-Date: Tue, 27 Jan 2015 15:59:00 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Tuesday 27 January 2015 09:43:06 Walter Giroir wrote:
> The IMAGE_CMD is defined in the layer=E2=80=99s conf.  I can corrupt =
this file and
> bitbake never complains so it appears it is never parsed or loaded.

How are you corrupting it? And I presume you mean sdcard_image-sunxi-
wigwag.bbclass not the layer's conf.

You can determine for certain whether the layer conf, the machine conf =
and the=20
bbclass are being parsed by looking at the list of files at the top of =
the=20
output of this command:

 bitbake -e <image> | less

(It's important that you specify the image in the command, because othe=
rwise=20
you won't see anything that's brought in via IMAGE_CLASSES.)

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre

