Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id EDFE379EB4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Nov 2018 08:31:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wA88UQMm027780
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 8 Nov 2018 00:30:36 -0800
Received: from [128.224.162.218] (128.224.162.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Thu, 8 Nov 2018 00:30:15 -0800
To: Yeoh Ee Peng <ee.peng.yeoh@intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <1541664141-55191-1-git-send-email-ee.peng.yeoh@intel.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <5f602a03-f953-24d3-8ac9-b73702631970@windriver.com>
Date: Thu, 8 Nov 2018 16:36:40 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1541664141-55191-1-git-send-email-ee.peng.yeoh@intel.com>
X-Originating-IP: [128.224.162.218]
Subject: Re: [PATCH] oeqa/runtime: Add tests for gstreamer CLI
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
X-List-Received-Date: Thu, 08 Nov 2018 08:31:02 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Peng,

Does it require some gstreamer packages to be available on target?
Maybe some @OEHasPackage decorator needs to be added?

Best Regards,
Chen Qi

On 11/08/2018 04:02 PM, Yeoh Ee Peng wrote:
> We should not be finding GStreamer issues right around
> release time but that's what we seem to do.
>
> Port gstreamer tests from Intel Ref Kit.
> https://github.com/intel/intel-iot-refkit/blob/master/meta-iotqa/
> lib/oeqa/runtime/multimedia/gstreamer/gstreamer_cli.py
>
> Add tests for gstreamer commandline tools (gst-inspect-1.0
> & gst-launch-1.0).
>
> [YOCTO #11418]
>
> Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
> ---
>   meta/lib/oeqa/runtime/cases/gstreamer.py | 11 +++++++++++
>   1 file changed, 11 insertions(+)
>   create mode 100644 meta/lib/oeqa/runtime/cases/gstreamer.py
>
> diff --git a/meta/lib/oeqa/runtime/cases/gstreamer.py b/meta/lib/oeqa/runtime/cases/gstreamer.py
> new file mode 100644
> index 0000000..3adeeb5
> --- /dev/null
> +++ b/meta/lib/oeqa/runtime/cases/gstreamer.py
> @@ -0,0 +1,11 @@
> +from oeqa.runtime.case import OERuntimeTestCase
> +
> +class GstreamerCliTest(OERuntimeTestCase):
> +
> +    def test_gst_inspect_can_list_all_plugins(self):
> +        status, output = self.target.run('gst-inspect-1.0')
> +        self.assertEqual(status, 0, 'gst-inspect-1.0 does not appear to be running.')
> +
> +    def test_gst_launch_can_create_video_pipeline(self):
> +        status, output = self.target.run('gst-launch-1.0 -v fakesrc silent=false num-buffers=3 ! fakesink silent=false')
> +        self.assertEqual(status, 0, 'gst-launch-1.0 does not appear to be running.')



