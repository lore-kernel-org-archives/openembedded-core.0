Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f170.google.com (mail-ve0-f170.google.com
	[209.85.128.170])
	by mail.openembedded.org (Postfix) with ESMTP id 4FEDB61A4A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 May 2013 09:27:07 +0000 (UTC)
Received: by mail-ve0-f170.google.com with SMTP id 15so3271699vea.29
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 May 2013 02:27:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=otIDs9LHGI0M/I1Bz/QNKlfeqJmVsOIJQEpAI+C73+g=;
	b=VzQwG23wixUOXEpwz2NqOUlmONfjiadtClfgxf1lTJUOo33V0izSjIbe3WJ/0io4aT
	07fG06i90fjeWAk7Afszw9rqQLPHtfEqeJnLJg+PkoGK73LuqxBQWhnFhaGpbantCzaC
	xxMZiBYjLfGXw/cWpbRwIQ6bXEbCfcptxnDgqZ6Y1pHEuyH3b92pTg7QLyBVEFT+cv9s
	wZpGhGBS3hseMY3N/udq9govGj4rgnenzvLTmJIvU5KXlOULok1YvZk1X0fI+ojP10ZO
	LzeYVyfmdzpDnTGcz32zEg5axF7yCi9Xt//AAZ4cAjuLtP/luZV+wzk4a5SSxOaq5Fe5
	o1Pg==
X-Received: by 10.220.96.76 with SMTP id g12mr7796593vcn.53.1369387628237;
	Fri, 24 May 2013 02:27:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.98.7 with HTTP; Fri, 24 May 2013 02:26:48 -0700 (PDT)
In-Reply-To: <378bb703a42148959f40a19e2e0a64c13ecdb482.1369386157.git.ionutx.radu@intel.com>
References: <cover.1369386157.git.ionutx.radu@intel.com>
	<378bb703a42148959f40a19e2e0a64c13ecdb482.1369386157.git.ionutx.radu@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 24 May 2013 10:26:48 +0100
Message-ID: <CAJTo0LZyLq2n=g4NvAsx7zyCJC5QE9ONnPEHkZsAS19=EQe13g@mail.gmail.com>
To: Ionut Radu <ionutx.radu@intel.com>
X-Gm-Message-State: ALoCoQm7jPWkd1qZSgoalA/Xkif9of1s7V8ccrYjjzZaPzaIisXSNzXBBqNGvUoC7FwRhQ9WydI9
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 5/7] matchbox-keyboard: Update to 0.0+gitAUTOINCa+a17b1135daab9eb4cd3647c02e82687f96d93619
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
X-List-Received-Date: Fri, 24 May 2013 09:27:07 -0000
Content-Type: text/plain; charset=UTF-8

On 24 May 2013 10:18, Ionut Radu <ionutx.radu@intel.com> wrote:
> Signed-off-by: Ionut Radu <ionutx.radu@intel.com>
>
> matchbox-keyboard: png-fix.patch was backported. (The newest version
> contains 'png-fix.patch' changes).

Did you test this worked on a device/qemu?  There's been some heavy
work upstream that hasn't been tested in our environment.

Ross

