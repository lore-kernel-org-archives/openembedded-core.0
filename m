Return-Path: <twoerner@gmail.com>
Received: from mail-vk0-f48.google.com (mail-vk0-f48.google.com
	[209.85.213.48])
	by mail.openembedded.org (Postfix) with ESMTP id 739EF71CE7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Apr 2017 16:05:07 +0000 (UTC)
Received: by mail-vk0-f48.google.com with SMTP id k4so38810011vki.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Apr 2017 09:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=34/8GRtzzv81alICMkxAat8owfu4l6YhMIJyMXOwPnY=;
	b=J9muBMi+SL1qWVzzVUfhjmGkiFXLeio+Y9Mv5AxWPDWk0f75vgCxVcxF2sglZu0QE8
	VzW9iYpqPOOcW3MgIw3D1lF1S0XaOutN1nuEWKDKl6amqSWFuK7givoEEhy6VQtUCSfk
	qd7kDX9xqjSZ3MPpBZORKWvDKL9KmgkzaYZg7Ou+rMs6p0iv0q424R1VAZfl80h0TiFb
	e81LFwI4R3ENriqrjTlxTjpCiBWpjFe6Wd/pXIxkR7Vix52XpDGsKrjoOnNiwzj7/T1P
	BcC6ndv139asznFz02MQXS/NFEDOjrGWta64UHZqmSDViKBFRP/xaFRtMTS9rN5iBw7f
	If9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=34/8GRtzzv81alICMkxAat8owfu4l6YhMIJyMXOwPnY=;
	b=ooLvI9SUE/vn/2b2urfP+ujG1sdxc+BC5p+nRtv+2lUbWhk2Fd17q4iHaH8Y0Xcg5Z
	wfMCuDLds9nN5QT6ZrwA0xfGeE71Q6U2rTXmNVrh+qAmv0Y/PA2knzbguWRbxyxAt24m
	MGypo0DqUO+XlXzrHwB0mz2Hn6iFZv4OGe0XYmE9DCv3pTkRZ57A9OEwPezEQZkcfb2F
	0GRodBizeXmU8J/bQr3YWOZNC9N9D1DuxdbZJ+T1AwXQ4xBhREPwht1e1y+O7qTZzeNI
	AFIaPyrs9exQ9A+Zv+bkxlfkFvDwUSJe407lFUT790uiK9TC6v0hMkTQ+g48Qy1O3s6U
	/49A==
X-Gm-Message-State: AN3rC/4iIe1xF5Y18Df6B2vp73hXvOBQPsBWpjxFCv8CqOKwVzs9CM46
	i3+q0JlsZzVQ4y2Hncl7CMdFVmID0g==
X-Received: by 10.31.242.69 with SMTP id q66mr3169279vkh.53.1493049908268;
	Mon, 24 Apr 2017 09:05:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.67.65 with HTTP; Mon, 24 Apr 2017 09:05:07 -0700 (PDT)
In-Reply-To: <CAJTo0LbgWj0uz8XrB5ofGOCs6FTtACE4g4vbXxVSrGu-yN6pQw@mail.gmail.com>
References: <CALxi_JEEcpVbqSuaUbqd-GrNw7jdn2JU196tofw3jYHtowhMGw@mail.gmail.com>
	<CAJTo0LbK23V+To_EhP_jOT89a5Uz+TPSqaiCax-tGXz5HyZ2qg@mail.gmail.com>
	<CALxi_JE_6qJVza0p825Ooe3YgZn89af3Cuxbpp0g=TydJtgOpA@mail.gmail.com>
	<CAJTo0LbgWj0uz8XrB5ofGOCs6FTtACE4g4vbXxVSrGu-yN6pQw@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
Date: Mon, 24 Apr 2017 12:05:07 -0400
Message-ID: <CAHUNapT-aiuWn5GZ=LvdunfGoODChH9U767aHCZyt9mdrB0k5Q@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Add LAPACK/ATLAS/BLAS library to OE-CORE
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
X-List-Received-Date: Mon, 24 Apr 2017 16:05:08 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Apr 24, 2017 at 10:32 AM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 24 April 2017 at 15:29, david bensoussan <minipada@gmail.com> wrote:
>>
>> I'm going to make some tests if it's possible and if performance is good
>> doing so. If not, from what I understand, the PR will probably be refused?
>
>
> For oe-core, yes.  There are other layers, such as meta-oe, but I'd actually
> suggest as you'll be shipping binaries in the layer that you write your own
> layer and publish it.


Or meta-ros?
https://layers.openembedded.org/layerindex/branch/master/layer/meta-ros/

