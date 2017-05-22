Return-Path: <mkelly@xevo.com>
X-Greylist: delayed 908 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 22 May 2017 17:44:18 UTC
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
	(mail-cys01nam02on0040.outbound.protection.outlook.com
	[104.47.37.40])
	by mail.openembedded.org (Postfix) with ESMTP id 1246A7017B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 May 2017 17:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=his0MgfrYQ0R6rew+Q3Rwrbvg3li2Slicqk1sMVOwMk=;
	b=jw4ekgLRtnmicUaLdiwhN0utpWAE7gygw+IwEKThNqSnADkItO6wG3iarEAyApuPkFP5LCgXQDSg5ei3rD0NG0NO8p30es64nt5UxRlhhXNBSCavWzH5GMSez7y831xSnJiaadNSD6rQqbFvAHjwXin8Zt+ktvw9ufzbPPA+29E=
Authentication-Results: windriver.com; dkim=none (message not signed)
	header.d=none; windriver.com;
	dmarc=none action=none header.from=xevo.com; 
Received: from [10.111.60.102] (66.162.141.202) by
	CY4PR01MB2679.prod.exchangelabs.com (10.172.135.13) with Microsoft SMTP
	Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1101.14; Mon, 22 May 2017 17:29:08 +0000
To: <openembedded-core@lists.openembedded.org>
References: <1493752813-18913-1-git-send-email-mkelly@xevo.com>
From: Martin Kelly <mkelly@xevo.com>
Message-ID: <816f658a-cb3c-2312-99ad-d7e5e3fd2bce@xevo.com>
Date: Mon, 22 May 2017 10:29:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1493752813-18913-1-git-send-email-mkelly@xevo.com>
X-Originating-IP: [66.162.141.202]
X-ClientProxiedBy: BN6PR19CA0038.namprd19.prod.outlook.com (10.173.148.152) To
	CY4PR01MB2679.prod.exchangelabs.com (10.172.135.13)
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PR01MB2679:
X-MS-Office365-Filtering-Correlation-Id: ca6041d3-abd5-4799-f75d-08d4a1380e8a
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(201703131423075)(201703031133081);
	SRVR:CY4PR01MB2679; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR01MB2679;
	3:ldEdZsJX10lyTbL6Mm6I5ITAVdT+MBmWGJyiHQ2cHtk5Wk2XFTislubL6ICaouNLgKmQLs1Xyiwf2/5NR6Gxi0b53M8vQfBXlMaNRQtGiBuofwDsl6o5WIlR02K9kdcuofPis4Zs93oP1XuUHrpAwMuUxFgbtQx/0WRdgE/OaEoCYZ6K8fwWZFthM0f34vGBKCZWdVDCSApEaKRkz9mV/cS6HEYe5wQ6t4oq04jXSP5tKIb2XFwb5ilZYrj9zj/XWCxqK3RePlJczFkyDwAmr7bWVeZjqw/qo6AuDARp7bOci8tO0TAi2CbXpzlhizQGCjsZmeTdjK8ljmq2BY9lsQ==;
	25:RLe7JAg6zKO92xggjZ3Zz77eoHpRrBuCFIGMzfGb62VDYFg4GUsqUCRUbqJ6fHsAwWA0WaOH98zvAzzEIWklJvzl3rDUS6DTkoVdKfvPWzicGS6mJAbMdqKI5WWjPOFtKsdioIXruplRtBDRTd36KXUQ2paZ64fvatdcrlppsZ9mEnr5OUPj+GbrOcanZuhTjeMjIMzptu85E3kTK/ETLzo+GKIETwYNRn8JTN/eoJaaBBZ4mZRWBayF2Aki8SmEpYU6OYGM6r+r6R+HjKO2R8QJCEgPDa5f9inJIff3JFq+6NpcB/OmKG5ncP0hZ4ToBOn9QPaDJhlRkzA+4Yq3PQDWag01ernwU3thfaqDQ+zPiPciFgn7j8UUlUm5TPoBLuTRrAPp0+Z+p7qtcbD+dj/MC6Kjz79Rk6NP2WRDbS9INvwk1n6sgBSoWESiScNV1uFzTed6yN3SEU479wYYDoVMO+zJGlAySkSWJxAGkFQ=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR01MB2679;
	31:rw8MtPYZ13VThUklig3pJq9T81eSlO/D2KAgZ+q6zGL8dT7d8qhkr1ZlAaJs/cP7JYkcqxAfQ494E7Vr9jnesOT206YU2zttVgxCiyR89dTCCfOIt9NelgA99QY6QmTov3uV42Pux39GBUPAPy5djWwXaX2NIwDks+9IHPjdcnR6kKFYKPLEg1kRvIOfbk3Pt7w9h5hec2fs+4aPKL5dYwwbazpZMsOtuQ6/AX16HOi47y5tqiBE2ofH6lwzMIlm;
	20:flrB6KxajDmHxclTznOQ+Opmth7lPfiCO4U5gNHIk1WFfMrIX9/2NGYOAxgECe93SHhqzzsC66CWWhbEQ5FYuSTiyfttcuBy3oHfhlUhL8GJaYxDIxVdO1Lq/A9IhUOgvPQ7DnwcSzB8JSBKHe9aPkRjgqy/TN+MBuy6ItSCd6N2cV0bwAak+CWbX9D6TIvJ/8Rp9ka+MhHCgx7y8RqL11cYWrIn3Zx5sCYCqAhNZsqvH5dyZPPVk0X48mH21rwFSEo2G322/i5Q3aDAW0A29AVhUTp3dCrKLL6u/L05k0WLDysxdgT8wm4cHmLMKX0lQ+Xa4Lr76N/C8Nflgwc5bw==
X-Microsoft-Antispam-PRVS: <CY4PR01MB267985F0EB92E3AA1924C8AEABF80@CY4PR01MB2679.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040450)(2401047)(5005006)(8121501046)(10201501046)(3002001)(93006095)(93001095)(6041248)(20161123560025)(20161123558100)(20161123562025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123555025)(20161123564025)(6072148);
	SRVR:CY4PR01MB2679; BCL:0; PCL:0; RULEID:; SRVR:CY4PR01MB2679; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR01MB2679;
	4:AQIXbzuU5TbBk4bGKT63VPJ4L9rWOl/25ll9W4UQDDASf4KEPAWkmimrjB/f8InYgg+Xkd65kCn6vFudgLL0x7eZtbHiCrsedIaftpL175lESmeVlawxeAN//VXSoBxkT+NK5Qgu2qNtGITjqnTUH8LML2MGh2nDYZI5DnQvVgsT+cS5e8NhFLJOnx95vkrORc+cZDZDVsEay/NrdON7CraG7eRqKodUEGnl/cc+7ZAXNK9RhADCxkKDOHREoisGCQUJEz9DQohiAuuuU26h/oz8X5OVjVJjVApSxwXl+8CJVTilV1ke9G1Z5onb+3mEP9KVWLTR54fd+BjjL8MjpIRVU2ygiXC2GDeOfsHcSU/7m3eDQ8u9sN4hU9XWexVNuiamRyLFf1XPITkrHtVwX9vqv6gjbXIOrJCGep+hR9OXrEW9nD9eWkLU2QKcwS2j4ol4+ZC/z7ZcSQgnS2aRt+cYW2/W6D+hmlVh/7R7J+h2uVKewJNpP0HABBAY7taocmZl2qaGhXdy1/z9rcTgKBNI11KX6tdMRp78yUYFrddGZcYw2S3fr1i1fGyAUR1aXeGwxgehe9oXDetxrF8p+1NqI32waMrpSpH8tnusLqGk6JpP2tnYY+kTExBtcnbQqogLref908NkY/v57i17HkSyejoSjUtDHJd7W/JkE8xGTHzSg3+YFg2jnGRV7dXdI/cumHf1Ak6DWcj3bahdaMr11TA4nEle1g0YOmwJHqkRTN7b1XKi80ttXDdvkzNufM6gMY80ef40pJoJn3ePfg==
X-Forefront-PRVS: 03152A99FF
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6009001)(6049001)(39400400002)(39830400002)(39410400002)(39450400003)(377454003)(24454002)(6306002)(305945005)(189998001)(64126003)(54906002)(86362001)(36756003)(77096006)(6486002)(5660300001)(229853002)(6666003)(6246003)(2950100002)(53936002)(6916009)(31696002)(23746002)(76176999)(38730400002)(110136004)(65826007)(50986999)(54356999)(4326008)(42186005)(966005)(8676002)(81166006)(31686004)(2906002)(50466002)(7736002)(3846002)(6116002)(65806001)(53546009)(33646002)(47776003)(2351001)(230700001)(478600001)(25786009)(66066001)(65956001)(83506001)(4001350100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR01MB2679; H:[10.111.60.102];
	FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?Windows-1252?Q?1; CY4PR01MB2679;
	23:WmZ8urafo1llGMDxo/TYGE0Ef6mJahupN1Av9?=
	=?Windows-1252?Q?JloDvMs9ogtUtjiJ7W08gs9t9elwyEr7oZj+96Egxz9AwLZZchinH+rZ?=
	=?Windows-1252?Q?zroMd5jBWqyLHBONgBxwaYfvv6apN8C6HYn3woUE0AAM3kbAci88K7io?=
	=?Windows-1252?Q?IswMl1aOAQsnc6BAKRQZpgvmG5ITmDCKyPgXdr50FAHH1BZG2jZHUX4o?=
	=?Windows-1252?Q?amq8WbJ6NeS0tTpHbvj+Oimx3s9GAj+PQu49DwVSObM7bvSYT0TXIF3c?=
	=?Windows-1252?Q?CjaJe7Nm2YIfUaYfLRZ35fG1WJ+hBPzFoQqHxzNv5afMhdoH/ZJPItQq?=
	=?Windows-1252?Q?V2nSC3oGaGtp/HG2nJR0lzT8HC/c9HbYi1kamFKw6nG7z3M+01mbFRB1?=
	=?Windows-1252?Q?pvSLyQT1hWMSh78Bgmpphmrfj/cOxhfYSF/SIedhkH23TNRW1OU48tCw?=
	=?Windows-1252?Q?Uxx/BLOjEoj+12Mx+63bV6n4m52VMQ768uPRCS98uD9JoINKsHoe71S5?=
	=?Windows-1252?Q?3KA1ux600Z/hIh8/5itBd8/ngOIS1cwagD3Si/8eeXIcHm8XlkAx+5uC?=
	=?Windows-1252?Q?Ma5myDKaTQLT2Wh+p/WF+MWvxFAz70a+7e14D11vC/Q4EkBaVqWAQFAt?=
	=?Windows-1252?Q?43iVxgZLclH1on37WVAxlMjKGi+sMVTCOHuj0otlv2gLRGeIxAIq3FMa?=
	=?Windows-1252?Q?Qw4wNt/krLYiwhu5jJhgjojyAvRo4GtETlxOmvSd8ZF5OJ9vEq6yEzX0?=
	=?Windows-1252?Q?HjeEdvjaIOhChhAHjJUi2p5vqLJvnUjH0YTWoRAG+oyvMgyP+zwam34C?=
	=?Windows-1252?Q?2fLfmm3lYs0XYycERAAI3RtXDAyXuwpkFs8c1DBzV4DrTAAd/ixqFfY6?=
	=?Windows-1252?Q?Y7vxUU1VcooilbvcsEXlrZnwJwQ7N20tO205tId92feh3z5+uIgQ84Wx?=
	=?Windows-1252?Q?xxwnWpA4AjgnVBBBDF3ckeU1QeT0fB2reyRvwdZkLbTvplm0Y7OUcv8R?=
	=?Windows-1252?Q?SU3hMh5YOnNPR2dhKy/9hZXT/oWYFkLZ3uJ+3ptuDXs2XctRdwKj7lUX?=
	=?Windows-1252?Q?1l+2eB84oLrisADzVZKEooa727yFK7ABeS6c1gsHkQXFbSEFAxGDUeqw?=
	=?Windows-1252?Q?5y4k/rr6S0RISEj1Q36ifs8JRTctF4qRN/YnK8BVGVJy7TOjHjow1oQd?=
	=?Windows-1252?Q?xswypEelMuJWnOFdWjlc55YhkULvk9Vs6lqzKwqAqmBBEIm2S3Vm0xOr?=
	=?Windows-1252?Q?8gO9QpYkaZrC/v9jU8mTjTFekAuscz+36SSwcvWSpF8+QBOti4Yq6cmV?=
	=?Windows-1252?Q?82NMaBs2kA5956p6YzldmUy1OHOJTktU7pDHkgEnwpK0v38dIHDjHWoc?=
	=?Windows-1252?Q?oIkwwLdwCsCUkRH9Y+2Ya/Pto/j5KjqU73fjkFp+RL1w0EYtk5mUACL9?=
	=?Windows-1252?Q?MXw0qN4CgIbdKuioS8+QEgCVfVWRoC12d89xx67IQ=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR01MB2679;
	6:eSuQLIw4Ng3OLVKTWeqRaAjvKy7optQMmBS9qghlwwvx7hj+6vD3W9sKG7CXDBBfaRb/2NnEIFGjPyoU9z/ni+c6JSU9bQf/CWpwxNr8vFbGcXmgzOzAsaR+wg8d/dFzIoPuBXZWKuUj3sV1lGcqVLxA8zXMCZ/YQtQcpKE39BugFcdNUxiigBilJLN/1xINoY6/RfffWKOoGtH1cR7a1D7dzr6UZ1VfGgWAZ4F2c9SmOz+f6iyu20Q2W7HccDWgxNFsfKixNzsg6IxP432KbuqD5CPgHQe+zunLtg00mZ4u8B/QRm6m2FrdG0zhnaE2eZq99EEb/lFuRhOxcUwP3I/iPfR+16SSWFLlVfnUQ5QHISN58G86HekI4tmGyT42EjzV6uwak0hAgxTtn1i/6BHzIkhE7/4QS0yHJ8chbrGoIRB0MoYyRu8s8C/auO/vBfkEj8sqTrxQqYlWBRwElO1Ih8VEOT+stkeoXyp2NRoPfXVHYS+5Y+A466DWr80TPSu3Ao5WG7UEBDbDbYXDsA==;
	5:/1EL0720Mt33d7xBUajeGyUBzwkdPqDlxJIgKDNOp/JV5Urhc/NoWBUkJCnkFY9Kbu5MojDF/Q7+fuHCE4MPmFKTeJ24tLxsoHRzSTHIbzFHXR+sG6BNW6tlKiYoAL0FrWmH6zCpmW/MsetSw1ftcQ==;
	24:kM70OZ+ntH+a2y4NVbTGERxZl7misWDulpos/av0nbqlX47tRLhdr/L40Uj0bQmc/MY4+24wJX9HV5AjNvZ0dQt726lpYYwlYVsk9gr91oc=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; CY4PR01MB2679;
	7:ick7gdWJ3HGeJc8iTr8L4bjNO9MN6iMZrsZETObjnix5TKyq/QDlggrzIsvyuVnnz29nLvzqzPtrWtc/43/BPS0/QiJ3Pb+sMEj98IjmPMrhZyEeBT5tVqanQXqcrqypSgL6x4vHfAWqPnYcOk+M+QKGreqTN7gZW/gzq0pWGHJVnZkwzpUNOBpeS5hgcHGCYuKe6ZRhdZX2C+3i0FPNCYwT6nUCeDEY4WvEF119QEJ9E/em1anRhqlQnjhISfw7KUUzOUw0uyqG33bWzrChK62a4il2LG7BZtGBzgR9ZwJAjDEtYoAvTQJ1gP51aDs0UJ+bqVFmmm+AlbVewbSWmw==
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2017 17:29:08.1045 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR01MB2679
Cc: Joshua G Lock <joshua.g.lock@intel.com>
Subject: Re: [PATCH resend] qemuboot.conf: make cpus match built artifacts
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
X-List-Received-Date: Mon, 22 May 2017 17:44:19 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

(friendly ping)

On 05/02/2017 12:20 PM, Martin Kelly wrote:
> Currently, the qemu CPUs for are specified as generic, but the built
> artifacts are not. For example, we build x86-64 artifacts targeting
> core2duo but run them in qemu with generic qemu/kvm CPUs. This causes
> some packages that take advantage of the host architecture to crash
> because they try to use CPU features not advertised by qemu. As an
> example, Qt uses ssse3. When artifacts linked against Qt and built
> targeting core2duo attempt to run on a generic qemu/kvm CPU, we get
> the following crash:
>
> Incompatible processor. This Qt build requires the following features:
>      ssse3
>
> We could fix this by making packages like Qt not take advantage of CPU
> features. However, we will probably keep facing similar issues over
> time, so it's better to resolve them in a more enduring way.
>
> Fix this by making the qemu -cpu arguments match the built artifacts.
>
> Signed-off-by: Martin Kelly <mkelly@xevo.com>
> ---
>
> I sent this to poky@yoctoproject.org but it should have gone to OE-core,
> so I'm resending it now to restart the discussion on the right mailing
> list. There were some comments about it in a previous mail thread on the
> poky mailing list:
>
> https://lists.yoctoproject.org/pipermail/poky/2017-April/010956.html
>
>  meta/conf/machine/include/qemuboot-x86.inc | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/conf/machine/include/qemuboot-x86.inc b/meta/conf/machine/include/qemuboot-x86.inc
> index 06ac983..acd03a1 100644
> --- a/meta/conf/machine/include/qemuboot-x86.inc
> +++ b/meta/conf/machine/include/qemuboot-x86.inc
> @@ -1,12 +1,12 @@
>  # For runqemu
>  IMAGE_CLASSES += "qemuboot"
>  QB_SYSTEM_NAME_x86 = "qemu-system-i386"
> -QB_CPU_x86 = "-cpu qemu32"
> -QB_CPU_KVM_x86 = "-cpu kvm32"
> +QB_CPU_x86 = "-cpu pentium2"
> +QB_CPU_KVM_x86 = "-cpu pentium2"
>
>  QB_SYSTEM_NAME_x86-64 = "qemu-system-x86_64"
>  QB_CPU_x86-64 = "-cpu core2duo"
> -QB_CPU_KVM_x86-64 = "-cpu kvm64"
> +QB_CPU_KVM_x86-64 = "-cpu core2duo"
>
>  QB_AUDIO_DRV = "alsa"
>  QB_AUDIO_OPT = "-soundhw ac97,es1370"
>

