Return-Path: <alistair23@gmail.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id B2D2F71BE5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Apr 2017 21:08:32 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id g11so1010391oib.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Apr 2017 14:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=la8yzwKcFI3GNlqwe1Gi2SKKb9aV1VEy3hwSGJW9XDc=;
	b=DR9u7PJ5lDXXw8oIZTwGucgLKVtgZq/S81i8jtijJHntDv0eiRelCGWuhn7Z5J1U25
	Ti7xdLWKFY4NxmPecC67kPVMDOh5eENCJHTPyk4Pb8UA8U9AQIRwMoWZN7NJJ203MBZD
	a0480iQt4xswt2NUgO0XQav9ovunUJl80mOnUXEKb25t41U2pgS3zpWS8UWdTkv77/Lr
	dfpqdvlNaYeghjoOZYgnYA5EnUbzH94l3YI/ItHKP7fTcXva16bhhu0eQSjfSgJQeHWD
	kKFw1UQW6aJtLvq8ZQlp+oQ9Oh9LZPShgXh95YzvgihZQ3Wm1bcid+aCn6BNXKzKZKY+
	todw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=la8yzwKcFI3GNlqwe1Gi2SKKb9aV1VEy3hwSGJW9XDc=;
	b=LInvgzz4irjsHzKTiqgT6xgbB7CzfFVwIpo+tfuG9l59CQ0HcO27u7nuYa3u8mekdu
	3V5gXvAReq8Z2q70puOwn33VUvQZk6jf/nXyP/zFeTzB492BMZUwj/j0+vF0ajT4xWo3
	WOvUPUSnsqMOwnVGPrOIk+vPBtces8+tD3+WMzM/MgLNrmkUNpbm0VNZjnipU0S3O7OE
	RDIPdEQjiRxK3QM0vw3ChchUNs8ywvZhLUdTMgsDfAyI/+qEZIjnSDlZ/tTHGvtI/TFU
	qA2P2njL0L5TqnRkS0mBcAdwOUC/sE+esyq6IYPQ/+gJwgL2WrQiQjenDWsvV4G9YC12
	71Ew==
X-Gm-Message-State: AN3rC/73lrLuTnL9yzOCiYHzMVRi9Uaxwt9lc9MQrKNPfNde3AEbFbWy
	1vROBtGKyyJJqHACrfeGexRaqSRQfg==
X-Received: by 10.157.58.4 with SMTP id j4mr7937237otc.109.1492549713666; Tue,
	18 Apr 2017 14:08:33 -0700 (PDT)
MIME-Version: 1.0
Sender: alistair23@gmail.com
Received: by 10.182.44.229 with HTTP; Tue, 18 Apr 2017 14:08:03 -0700 (PDT)
In-Reply-To: <CAKmqyKOBYFdMWK5qG5UWJGRscrjX_c0S3JM6-DLFrwPXx8rXVw@mail.gmail.com>
References: <20170324203858.27464-1-alistair.francis@xilinx.com>
	<CAKmqyKM-wvykD1R+nyyCMjictWhLYRuOXYW1wmPPKrtVLyu9hw@mail.gmail.com>
	<CAKmqyKOBYFdMWK5qG5UWJGRscrjX_c0S3JM6-DLFrwPXx8rXVw@mail.gmail.com>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Tue, 18 Apr 2017 14:08:03 -0700
X-Google-Sender-Auth: vbMIAB7SANXLfLQzi8MDsE_QNFk
Message-ID: <CAKmqyKPPkvF-9e_HyAG1rg=vynYQMAQLRz1a-jqTVgS4BdwoVQ@mail.gmail.com>
To: Alistair Francis <alistair.francis@xilinx.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/2] runqemu: Automatically add a TFTP directory for slirp boot
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
X-List-Received-Date: Tue, 18 Apr 2017 21:08:33 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Apr 7, 2017 at 9:59 AM, Alistair Francis
<alistair.francis@xilinx.com> wrote:
> On Fri, Mar 31, 2017 at 10:07 AM, Alistair Francis <alistair23@gmail.com> wrote:
>> On Fri, Mar 24, 2017 at 1:38 PM, Alistair Francis
>> <alistair.francis@xilinx.com> wrote:
>>> When booting QEMU with slirp networking we want to use QEMUs TFTP server
>>> to make the images in deploy accessible to the guest.
>>>
>>> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
>>
>> Ping?
>
> Ping^2
>
> I received comments on the second patch, but nothing on this one.

Ping^3

>
> Thanks,
>
> Alistair
>
>>
>>> ---
>>>  scripts/runqemu | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/scripts/runqemu b/scripts/runqemu
>>> index 23c9efb..f76d976 100755
>>> --- a/scripts/runqemu
>>> +++ b/scripts/runqemu
>>> @@ -832,7 +832,7 @@ class BaseConfig(object):
>>>          self.kernel_cmdline_script += ' ip=dhcp'
>>>          # Port mapping
>>>          hostfwd = ",hostfwd=tcp::2222-:22,hostfwd=tcp::2323-:23"
>>> -        qb_slirp_opt_default = "-netdev user,id=net0%s" % hostfwd
>>> +        qb_slirp_opt_default = "-netdev user,id=net0%s,tftp=%s" % (hostfwd, self.get('DEPLOY_DIR_IMAGE'))
>>>          qb_slirp_opt = self.get('QB_SLIRP_OPT') or qb_slirp_opt_default
>>>          # Figure out the port
>>>          ports = re.findall('hostfwd=[^-]*:([0-9]+)-[^,-]*', qb_slirp_opt)
>>> --
>>> 2.9.3
>>>

