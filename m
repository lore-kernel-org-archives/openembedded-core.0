Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f176.google.com (mail-vc0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id 6563B6AF97
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jul 2013 13:13:52 +0000 (UTC)
Received: by mail-vc0-f176.google.com with SMTP id ha12so1643271vcb.35
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Jul 2013 06:13:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=hU6ekpjwb19tGQg1wHVdiejhdR27X57GJDsaMOKu74A=;
	b=QxTLoneIfOzk8+exCjmoUpD0FP+8cyc+PCCs9A2zxFiuyDyli1IguZInFbTfeTGgCa
	N6bsXGM93cshWyPem6yC5a3UISiyIz6nyYMpx+q66TE7gc0eIduttkCI7Atdg62IX0nS
	AUY+VyqNtho3AbE2uAvvmfNovuhye9iRp0czQ69bxwjvSJhhlQrOluzpNeTOjSBw2VbY
	5zAZMEfe8ES8DB7wPDCkNZ4uq/644MphuXESaKTuIZxvlDG82pqBPSkpS2Hf/1OFlFl4
	HfNwdgLhD/v8G6l7khqVMulhlDf0Lz1DtLKKxcfy7tbxySZRasAhja+KmkLdVOaqCXTW
	GTOQ==
X-Received: by 10.58.181.225 with SMTP id dz1mr6669916vec.95.1373030032178;
	Fri, 05 Jul 2013 06:13:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.13.144 with HTTP; Fri, 5 Jul 2013 06:13:32 -0700 (PDT)
In-Reply-To: <680c48c97e528b9e76c739ef5d9fb6147cbdc645.1372952884.git.ionutx.radu@intel.com>
References: <cover.1372952884.git.ionutx.radu@intel.com>
	<680c48c97e528b9e76c739ef5d9fb6147cbdc645.1372952884.git.ionutx.radu@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 5 Jul 2013 14:13:32 +0100
Message-ID: <CAJTo0Laoc1HviNY=kMpKFr4Do3iHB2F30tHy7+q49KRC-Fn7ug@mail.gmail.com>
To: Ionut Radu <ionutx.radu@intel.com>
X-Gm-Message-State: ALoCoQmSOTGx9MTEzQmm2PE/0aKASM+F5lzBSs37b44SAiwKZIPqTdlZYPw/EWlZo18bFqmdgFUU
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 09/10] freetype: Updated from 2.4.12 to 2.5.0
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
X-List-Received-Date: Fri, 05 Jul 2013 13:13:53 -0000
Content-Type: text/plain; charset=UTF-8

On 5 July 2013 08:10, Ionut Radu <ionutx.radu@intel.com> wrote:
>  .../freetype/{freetype_2.4.12.bb => freetype_2.5.0.bb}           |    6 ++----

Upstream says:

"Please download the 2.5.0.1 bundle of the FreeType library which
fixes a packaging error."

So please update this for 2.5.0.1.

Ross

