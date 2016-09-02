Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 2AD2E736B6
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Sep 2016 12:08:16 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga101.jf.intel.com with ESMTP; 02 Sep 2016 05:08:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,270,1470726000"; 
   d="scan'208";a="3965496"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.49])
	by fmsmga006.fm.intel.com with ESMTP; 02 Sep 2016 05:08:15 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Sep 2016 15:06:44 +0300
Message-Id: <20160902120645.5271-2-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20160902120645.5271-1-alexander.kanavin@linux.intel.com>
References: <20160902120645.5271-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 2/3] clutter-1.0: do not use the prepackaged clutter.types file when generating gtk-doc
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
X-List-Received-Date: Fri, 02 Sep 2016 12:08:16 -0000

Doing so will fail when x11 is disabled in particular.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...ter.types-as-it-is-build-configuration-sp.patch | 143 +++++++++++++++++++++
 .../recipes-graphics/clutter/clutter-1.0_1.26.0.bb |   1 +
 2 files changed, 144 insertions(+)
 create mode 100644 meta/recipes-graphics/clutter/clutter-1.0/0001-Remove-clutter.types-as-it-is-build-configuration-sp.patch

diff --git a/meta/recipes-graphics/clutter/clutter-1.0/0001-Remove-clutter.types-as-it-is-build-configuration-sp.patch b/meta/recipes-graphics/clutter/clutter-1.0/0001-Remove-clutter.types-as-it-is-build-configuration-sp.patch
new file mode 100644
index 0000000..7b3c198
--- /dev/null
+++ b/meta/recipes-graphics/clutter/clutter-1.0/0001-Remove-clutter.types-as-it-is-build-configuration-sp.patch
@@ -0,0 +1,143 @@
+From 3a0404dfbc65c6a864e01d1200a48074e19d5def Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Fri, 2 Sep 2016 14:28:38 +0300
+Subject: [PATCH] Remove clutter.types as it is build configuration-specific.
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ doc/reference/clutter.types | 122 --------------------------------------------
+ 1 file changed, 122 deletions(-)
+ delete mode 100644 doc/reference/clutter.types
+
+diff --git a/doc/reference/clutter.types b/doc/reference/clutter.types
+deleted file mode 100644
+index 0037acc..0000000
+--- a/doc/reference/clutter.types
++++ /dev/null
+@@ -1,122 +0,0 @@
+-cally_actor_get_type
+-cally_clone_get_type
+-cally_group_get_type
+-cally_rectangle_get_type
+-cally_root_get_type
+-cally_stage_get_type
+-cally_text_get_type
+-cally_texture_get_type
+-cally_util_get_type
+-clutter_action_get_type
+-clutter_actor_box_get_type
+-clutter_actor_get_type
+-clutter_actor_meta_get_type
+-clutter_align_constraint_get_type
+-clutter_alpha_get_type
+-clutter_animatable_get_type
+-clutter_animation_get_type
+-clutter_animator_get_type
+-clutter_animator_key_get_type
+-clutter_backend_get_type
+-clutter_behaviour_depth_get_type
+-clutter_behaviour_ellipse_get_type
+-clutter_behaviour_get_type
+-clutter_behaviour_opacity_get_type
+-clutter_behaviour_path_get_type
+-clutter_behaviour_rotate_get_type
+-clutter_behaviour_scale_get_type
+-clutter_bin_layout_get_type
+-clutter_bind_constraint_get_type
+-clutter_binding_pool_get_type
+-clutter_blur_effect_get_type
+-clutter_box_get_type
+-clutter_box_layout_get_type
+-clutter_brightness_contrast_effect_get_type
+-clutter_cairo_texture_get_type
+-clutter_canvas_get_type
+-clutter_child_meta_get_type
+-clutter_click_action_get_type
+-clutter_clip_node_get_type
+-clutter_clone_get_type
+-clutter_color_get_type
+-clutter_color_node_get_type
+-clutter_colorize_effect_get_type
+-clutter_constraint_get_type
+-clutter_container_get_type
+-clutter_content_get_type
+-clutter_deform_effect_get_type
+-clutter_desaturate_effect_get_type
+-clutter_device_manager_get_type
+-clutter_drag_action_get_type
+-clutter_drop_action_get_type
+-clutter_effect_get_type
+-clutter_event_get_type
+-clutter_event_sequence_get_type
+-clutter_fixed_layout_get_type
+-clutter_flow_layout_get_type
+-clutter_fog_get_type
+-clutter_geometry_get_type
+-clutter_gesture_action_get_type
+-clutter_glx_texture_pixmap_get_type
+-clutter_grid_layout_get_type
+-clutter_group_get_type
+-clutter_image_get_type
+-clutter_input_device_get_type
+-clutter_interval_get_type
+-clutter_keyframe_transition_get_type
+-clutter_knot_get_type
+-clutter_layout_manager_get_type
+-clutter_layout_meta_get_type
+-clutter_list_model_get_type
+-clutter_margin_get_type
+-clutter_media_get_type
+-clutter_model_get_type
+-clutter_model_iter_get_type
+-clutter_offscreen_effect_get_type
+-clutter_page_turn_effect_get_type
+-clutter_paint_node_get_type
+-clutter_paint_volume_get_type
+-clutter_pan_action_get_type
+-clutter_param_color_get_type
+-clutter_param_fixed_get_type
+-clutter_param_units_get_type
+-clutter_path_constraint_get_type
+-clutter_path_get_type
+-clutter_path_node_get_type
+-clutter_perspective_get_type
+-clutter_pipeline_node_get_type
+-clutter_point_get_type
+-clutter_property_transition_get_type
+-clutter_rect_get_type
+-clutter_rectangle_get_type
+-clutter_rotate_action_get_type
+-clutter_score_get_type
+-clutter_script_get_type
+-clutter_scriptable_get_type
+-clutter_scroll_actor_get_type
+-clutter_settings_get_type
+-clutter_shader_effect_get_type
+-clutter_shader_float_get_type
+-clutter_shader_get_type
+-clutter_shader_int_get_type
+-clutter_shader_matrix_get_type
+-clutter_size_get_type
+-clutter_snap_constraint_get_type
+-clutter_stage_get_type
+-clutter_stage_manager_get_type
+-clutter_state_get_type
+-clutter_state_key_get_type
+-clutter_swipe_action_get_type
+-clutter_table_layout_get_type
+-clutter_tap_action_get_type
+-clutter_text_buffer_get_type
+-clutter_text_get_type
+-clutter_text_node_get_type
+-clutter_texture_get_type
+-clutter_texture_node_get_type
+-clutter_timeline_get_type
+-clutter_transition_get_type
+-clutter_transition_group_get_type
+-clutter_units_get_type
+-clutter_vertex_get_type
+-clutter_zoom_action_get_type
+-- 
+2.9.3
+
diff --git a/meta/recipes-graphics/clutter/clutter-1.0_1.26.0.bb b/meta/recipes-graphics/clutter/clutter-1.0_1.26.0.bb
index fba9959..dfa1cfe 100644
--- a/meta/recipes-graphics/clutter/clutter-1.0_1.26.0.bb
+++ b/meta/recipes-graphics/clutter/clutter-1.0_1.26.0.bb
@@ -6,4 +6,5 @@ SRC_URI[archive.md5sum] = "b065e9ca53d1f6bc1ec26aeb27338bb7"
 SRC_URI[archive.sha256sum] = "67514e7824b3feb4723164084b36d6ce1ae41cb3a9897e9f1a56c8334993ce06"
 SRC_URI += "file://install-examples.patch \
             file://run-installed-tests-with-tap-output.patch \
+            file://0001-Remove-clutter.types-as-it-is-build-configuration-sp.patch \
             file://run-ptest"
-- 
2.9.3


