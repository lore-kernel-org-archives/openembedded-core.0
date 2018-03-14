Return-Path: <jpmv27@yahoo.com>
Received: from sonic316-14.consmr.mail.bf2.yahoo.com
	(sonic316-14.consmr.mail.bf2.yahoo.com [74.6.130.124])
	by mail.openembedded.org (Postfix) with ESMTP id 24D656E666
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2018 22:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
	t=1521066059; bh=o4AuRcMOhJEHr8E7gOOvnhUF9DFQEvy0PZHPXIt/LwA=;
	h=Subject:From:To:References:Date:In-Reply-To:From:Subject;
	b=MxN7dlhYCpYC0xSvUXaVUPYxup7dJ7IQqcDFhBW8sNZkbjiuIQVaWFs/8g794TJ5hwnlsK1c1//GV0Zj6HR3BF1y6E9g90YraAVyXQvrwLfytH7HiUvVols56IS01hp6oxqd9Txme5W3eycZsUywhOtUoejnC2T2zU1dvj3jRuRF6Hj3bSNWWRhHhNWPJsQHO4Ef7WyjFlDxv5TcbjFSjN+Kpna+pY7RLaVoPgFx/XmN/BGIcKi0jJ4CF53bFRlkRfgb0AVtKPgmLaoTUaXNzeU6UNraDf9mZpIi5lr0umpFIvVYGLpGVPOBylCYBT4mcHKUCL/sKbvuJJ682/P+rw==
X-YMail-OSG: oGhYT9QVM1kSvT3_Z.jOhemUysblBr5uJPCBsY2nHk6R0M14r8v0dnIlcaawIm4
	7OzU978xfWmsv2URgF_2NEwfkTuZqRjVXGDg1XYLSs3LEsL8Hhbd5gSKbjLCkBB.xNJHWSoKWV.U
	d_z.j4XRwVsuPc2E0bWtValoaftZ42I3fgswy8fZRSjVR.BOrF5Y0VXtsG1fz_6oWiLsnpW.5qga
	VoLmoEIxdsKkSfDL01QJqtA0hX9yZDnmM6uyW5LSJw6ZScl_8p4vuPAhUhNuPsJwkWjn_ascZQkk
	wtLra9LADyal7eh4TZ4kTf8b0kY22FQsC2pHqVbkk2WVhzOaUON4KUPoE751dSCR2674Dp6v2k2z
	WxQHV9WhDuLtQ4rABexZrfjyL28vNWAlUahTemV3bKgPD5Yft833MNHGgaOwBRPSZ_uTmK1la9Cl
	auoMnkoSwjdwZXk.UP6Ctn.XQPL.yUFm490bGjgjK.PWJ3Pu8MqGvi8JdzEz_DlnI_z8BSlU0C_L
	Duxl3
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic316.consmr.mail.bf2.yahoo.com with HTTP;
	Wed, 14 Mar 2018 22:20:59 +0000
Received: from CPE000db93f888c-CM001404556d28.cpe.net.cable.rogers.com (EHLO
	[10.11.12.90]) ([99.246.128.134])
	by smtp418.mail.bf1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA ID
	c4c06d6e3b6cbd3700a9a702515fb7e9
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2018 22:20:55 +0000 (UTC)
From: Martin Vuille <jpmv27@yahoo.com>
To: Openembedded-core@lists.openembedded.org
References: <c1fcdce0-7ad4-d7ce-287b-3783579fc631@yahoo.com>
Message-ID: <8ef4b697-ea48-80eb-9068-7b15fd7cc944@yahoo.com>
Date: Wed, 14 Mar 2018 18:20:54 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <c1fcdce0-7ad4-d7ce-287b-3783579fc631@yahoo.com>
Subject: Re: Recipe for Linux page-types tool
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
X-List-Received-Date: Wed, 14 Mar 2018 22:20:58 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

page-types is a simple Linux kernel debugging tool to list information about
the state of virtual memory (VM) pages.

The source is distributed as part of the kernel tree: tools/vm/page-types.c

MV

On 03/14/18 11:22, Martin Vuille wrote:
> I have a recipe for building the page-types Linux kernel VM tool.
> Is there any interest in this?
> If so, to what project/layer should I send it?
> 
> MV

