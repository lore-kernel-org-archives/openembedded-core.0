Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f177.google.com (mail-qc0-f177.google.com
	[209.85.216.177])
	by mail.openembedded.org (Postfix) with ESMTP id 2EC3F60DD7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Oct 2014 16:15:58 +0000 (UTC)
Received: by mail-qc0-f177.google.com with SMTP id c9so2993491qcz.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Oct 2014 09:16:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=pLOxjBNODATrpaJ7/IsxAj58sRdFbKT9V8DZXixZ54Q=;
	b=gMJlaABxl4mb3MVYflMKvtnJ6ig2Egn3fM4FX+X2iI7NhoBJ4nO2sYb4aKANtwlw7S
	nzaKJ4Y854WGkaayZXI5lhxuWWam8m/y5vyVYVthq6TEvGOvSpMO2aUaK01oS3/Zc/c2
	Hz6+AbJjFKiyyEpPRnAeL0KiOHG3L2LinExFZu/8sPsjrmSVqNXOQhpQE+DHNm6cGS0c
	IQPXh/9RExiTheHS5abimy5g1D0KgKfblAKrjjMzlR4P6ThMX+kYaU9N6aYqCFdUT47R
	Wmd3nmrBcfLfmbNcJkWHtYQF1HXq/YFeBXAGpjB+DcoSUAjsGfmCXDLB6ROc3uuvJm3I
	Gq1Q==
X-Gm-Message-State: ALoCoQmfBNy73WEFCKRDEtc8cFslrguoE2c/v7DK+FkO3li9zZygbcn7Zh1R2AF+4FVqJuaOvW+B
X-Received: by 10.224.79.79 with SMTP id o15mr3424968qak.93.1413476160163;
	Thu, 16 Oct 2014 09:16:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.93.65 with HTTP; Thu, 16 Oct 2014 09:15:39 -0700 (PDT)
In-Reply-To: <3230301C09DEF9499B442BBE162C5E482576ADB6@SESTOEX04.enea.se>
References: <3230301C09DEF9499B442BBE162C5E482576880D@SESTOEX04.enea.se>
	<CAJTo0La=7QNS53qZDgShj+9yr6Ge0hyk9HFAdS+Ue0bZAkck4A@mail.gmail.com>
	<CAJTo0La9iMQ4ZiSuTFo35271c2McpzkSvugOEqL6dBNoncdkZQ@mail.gmail.com>
	<3230301C09DEF9499B442BBE162C5E482576ADB6@SESTOEX04.enea.se>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 16 Oct 2014 17:15:39 +0100
Message-ID: <CAJTo0LZ6BxOWawnJZRPTEgw2ewzNg58dUOj0uVrUpkBbon7eNA@mail.gmail.com>
To: Sona Sarmadi <sona.sarmadi@enea.com>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	Catalin Popeanga <Catalin.Popeanga@enea.com>
Subject: Re: Truly scary SSL 3.0 vuln to be revealed soon:
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
X-List-Received-Date: Thu, 16 Oct 2014 16:16:06 -0000
Content-Type: text/plain; charset=UTF-8

On 16 October 2014 17:09, Sona Sarmadi <sona.sarmadi@enea.com> wrote:
> Do you know if gnutls implements the SSLv3 protocol?  I don't see any new security updates for gnutls (related to the SSLv3 vulnerability) ?

Yes it does, and no there isn't.

Ross

