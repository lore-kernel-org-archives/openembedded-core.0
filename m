Return-Path: <philip@balister.org>
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by mail.openembedded.org (Postfix) with ESMTP id 9F7DD7C827
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Feb 2019 23:47:14 +0000 (UTC)
Received: (qmail 6487 invoked by uid 1003); 17 Feb 2019 23:47:14 -0000
Received: from unknown (HELO ?192.168.11.100?)
	(philip@opensdr.com@73.152.143.112)
	by mail.geekisp.com with (ECDHE-RSA-AES128-GCM-SHA256 encrypted) SMTP;
	17 Feb 2019 23:47:14 -0000
To: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
References: <1550192184-13460-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
	<1550192184-13460-2-git-send-email-manjukumar.harthikote-matha@xilinx.com>
From: Philip Balister <philip@balister.org>
Openpgp: preference=signencrypt
Autocrypt: addr=philip@balister.org; prefer-encrypt=mutual; keydata=
	xsBNBE6PN4EBCADXwOSVOvTrJ370tH2RmiR22OuCBcKfnKTLztyV5zA0veDB1kmrIajh+sJe
	HWNqsib0v19S3wdrvqzKrztSfNAgUctvkAuTOloU81dmbAjDSge6nFxjzIIz6XjNvmP5xl9J
	rstPm4i4dhAs5436xf4Bh0vn3C/Bp4fKwXBSW/Xto7vuiuSK03ojon3F8O2WNEmKxHyubFP1
	2tNvXOp/PeAR4LTnYq6fdAAofvbpbPDBg8qICe6j1UXaIyU93IbW+bJp1RFbeakWxiTw+eQ2
	fVjG5XnubNX0YBlmjHDJhjeqV1uwkImNHlZknecLjT7g37vIMwz+PTfPIhmIGffzqtHlABEB
	AAHNJVBoaWxpcCBCYWxpc3RlciA8cGhpbGlwQGJhbGlzdGVyLm9yZz7CwH4EEwECACgCGyMG
	CwkIBwMCBhUIAgkKCwQWAgMBAh4BAheABQJYM1D9BQkRKOdqAAoJEMDJd4rr0merDX4H/3Pr
	nYKDnml7LRiikoOTFJb4r7ub04skrkGI2DAYvRUPH110KXaan84Qo2Yl4r/ma15Lpqx+cdPR
	3KbFlSWyjgY6CMN/BclutsK4mFkoxnmhdYJvc5M2TDfZLxBPMTeQiHo0MwxUB5v81mv812bx
	YKfEOg3ndk7C/TE0Q8ZER7p6fU3ol/e0ilLyaCpd85nkEcOEI7BdBBGhKWii+Cwvv8g2ofQZ
	3wAsqQFp7PFxlEjo5Xc1QGqo7L+UlDG23QjUn33n+wZMZm9EUZFu1c1MAGZsvXiqKw8P07Mj
	yyf6h6EMVP8wME7gnkxsZkpKv04mSvKpDLIInmRW9ZlHXaJ4YxjOwE0ETo83gQEIAPs+ZC0R
	gF4blrRIiVHdkARncAxUwSUbti5Ku23dQ0iBizozh4YGucgW48gxsvJCkCc9s/4C9e3vYiCZ
	GVGC8x6Ll3vE7xwRQ/euVqJ0mXG7tNK1zAPpSgI6aooPSZCW7PBvwY8uMvzzCzP+EBd0+oA5
	uXQSEcyOJUYy4beferoHUiBjBkyNd+v2iaJf7KjAYYxJOcPvtnq/VL09hlmtCD5zghOn80rt
	LqF66BJkHmATopSWyor1qz7gmowdCkFkUJDNW7yJT1wVANqDd9P5A8vYhngwJTHsvXVftmvB
	gLiJjYuKst36G2AOHgm4ls5jRMa/k7jWue1RKM5LxzgBtLUAEQEAAcLAZQQYAQIADwIbDAUC
	WDNRbAUJESjn5AAKCRDAyXeK69Jnq1qYB/93aiBdenAuu0H/zGWEFFB14cdhDR4S4q0EbfXl
	1z9o3Irazw6WMtLe12zJ4/Xl41Mh/IH8/+AgDnigisrkKRN1TkiOGDUVnS0akkhML3ONbeFd
	ocYEwBAPDTxAaWNoyjDe/bORokSJn31cFoG6QYyzUct79npHorbaXW0zW+KC77Do53yUKQ8+
	icWpfiCMk1YzSHCr0y5NZNVxac9a0+IDzH/YBbNdJLNaMvXcuege1Qqz85pdR0P4XuCVRD2j
	ZAbcGJzZXlu9ZzpIHjtZoyF8paJRMQwzWEO3/Txksmm7K8eu8Tz2JVpjiOIj44MOTKoRGKjO
	6eUfr0u7CwnEyqiQ
Message-ID: <679c61e2-f179-c986-b6ca-b69b95b5e22a@balister.org>
Date: Sun, 17 Feb 2019 18:47:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <1550192184-13460-2-git-send-email-manjukumar.harthikote-matha@xilinx.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] kernel-fitimage.bbclass: Introduce a way to provide external dtb
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
X-List-Received-Date: Sun, 17 Feb 2019 23:47:15 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit

With these patches, I made a fitImage that booted on the mini-zed. It
would be nice to include a note on how to enable this. I took at few
stabs at it and ended up with

PREFERRED_PROVIDER_virtual/dtb = "devicetree"

in he machine file to get the code to trigger.

Philip

On 02/14/2019 07:56 PM, Manjukumar Matha wrote:
> Currently kernel-fitimage gets the dtb from KERNEL_DEVICETREE, however
> there are instances when the DTB file can be generated using other
> recipes, provide a way to include the DTB instead of inkernel device
> tree.
> 
> Add support for external device tree during the creation of fitimage.
> If virtual/dtb is set then use the path provided in
> EXTERNAL_KERNEL_DEVICETREE else use KERNEL_DEVICETREE during fitimage
> process
> 
> Signed-off-by: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
> ---
>  meta/classes/kernel-fitimage.bbclass | 20 +++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
> index 8ebd3dd..3adb1c9 100644
> --- a/meta/classes/kernel-fitimage.bbclass
> +++ b/meta/classes/kernel-fitimage.bbclass
> @@ -30,6 +30,13 @@ python __anonymous () {
>          if image:
>              d.appendVarFlag('do_assemble_fitimage_initramfs', 'depends', ' ${INITRAMFS_IMAGE}:do_image_complete')
>  
> +	#check if there are any dtb providers
> +        providerdtb = d.getVar("PREFERRED_PROVIDER_virtual/dtb")
> +        if providerdtb:
> +            d.appendVarFlag('do_assemble_fitimage', 'depends', ' virtual/dtb:do_populate_sysroot')
> +            d.appendVarFlag('do_assemble_fitimage_initramfs', 'depends', ' virtual/dtb:do_populate_sysroot')
> +            d.setVar('EXTERNAL_KERNEL_DEVICETREE', "${RECIPE_SYSROOT}/boot/devicetree")
> +
>          # Verified boot will sign the fitImage and append the public key to
>          # U-Boot dtb. We ensure the U-Boot dtb is deployed before assembling
>          # the fitImage:
> @@ -373,7 +380,8 @@ fitimage_assemble() {
>  	#
>  	# Step 2: Prepare a DTB image section
>  	#
> -	if [ -n "${KERNEL_DEVICETREE}" ]; then
> +
> +	if [ -z "${EXTERNAL_KERNEL_DEVICETREE}" ] && [ -n "${KERNEL_DEVICETREE}" ]; then
>  		dtbcount=1
>  		for DTB in ${KERNEL_DEVICETREE}; do
>  			if echo ${DTB} | grep -q '/dts/'; then
> @@ -391,6 +399,16 @@ fitimage_assemble() {
>  		done
>  	fi
>  
> +	if [ -n "${EXTERNAL_KERNEL_DEVICETREE}" ]; then
> +		dtbcount=1
> +		for DTBFILE in ${EXTERNAL_KERNEL_DEVICETREE}/*.dtb; do
> +			DTB=`basename ${DTBFILE}`
> +			DTB=$(echo "${DTB}" | tr '/' '_')
> +			DTBS="${DTBS} ${DTB}"
> +			fitimage_emit_section_dtb ${1} ${DTB} ${DTBFILE}
> +		done
> +	fi
> +
>  	#
>  	# Step 3: Prepare a setup section. (For x86)
>  	#
> 

